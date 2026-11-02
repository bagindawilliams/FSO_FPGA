"""Read-only baseline inventory; outputs documentation under onboarding/evidence."""
from pathlib import Path
import hashlib,json,xml.etree.ElementTree as E,re,collections,subprocess,zipfile
root=Path.cwd(); out=root/'onboarding/evidence'
files=sorted(p for p in root.rglob('*') if p.is_file() and 'onboarding' not in p.relative_to(root).parts and p.name!='AGENTS.md')
def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()
rows=[{'path':str(p.relative_to(root)),'bytes':p.stat().st_size,'sha256':sha(p),'extension':p.suffix.lower()} for p in files]
(out/'inventory.json').write_text(json.dumps(rows,indent=2))
manifest=''.join(f"{r['sha256']}  {r['path']}\n" for r in rows)
(out/'baseline.sha256').write_text(manifest)
sets=[]
for fs in E.parse('gt_ex.xpr').findall('.//FileSet'):
 for f in fs.findall('File'):
  raw=f.get('Path'); path=raw.replace('$PSRCDIR',str(root/'gt_ex.srcs')).replace('$PPRDIR',str(root)).replace('$PGENDIR',str(root/'gt_ex.gen'))
  sets.append({'set':fs.get('Name'),'raw':raw,'path':str(Path(path).relative_to(root)) if path.startswith(str(root)) else path,'exists':Path(path).is_file(),'attrs':[a.attrib for a in f.findall('.//Attr')]})
(out/'project_sources.json').write_text(json.dumps(sets,indent=2))
mods={}; bodies={}
for r in sets:
 p=Path(r['path'])
 if p.suffix not in ('.v','.sv') or not p.is_file():continue
 s=re.sub(r'/\*.*?\*/|//[^\n]*','',p.read_text(errors='replace'),flags=re.S)
 for m in re.finditer(r'\bmodule\s+(\w+)\b(.*?)\bendmodule\b',s,re.S):
  mods[m[1]]=r['path']; bodies[m[1]]=m[2]
ips={Path(r['path']).stem for r in sets if r['path'].endswith('.xci')}
names=set(mods)|ips|{'IBUFGDS','IBUFDS_GTE3','BUFG','BUFG_GT'}
edges=[]
for parent,body in bodies.items():
 for name in names:
  for m in re.finditer(r'\b'+re.escape(name)+r'\b\s+(?:#\s*\(.*?\)\s*)?(\w+)\s*\(',body,re.S):
   edges.append({'parent':parent,'module':name,'instance':m[1],'file':mods[parent]})
reach={'SDAOISL10Gto10G_top'}
while True:
 new=reach|{e['module'] for e in edges if e['parent'] in reach}
 if new==reach:break
 reach=new
(out/'hierarchy.json').write_text(json.dumps({'method':'Static lexical candidate graph, includes both generate branches; not Vivado elaboration','modules':mods,'reachable':sorted(reach),'edges':edges},indent=2))
lines=['set\tpath\texists\tclassification\tattributes']
for r in sets:
 mm=[m for m,p in mods.items() if p==r['path']]
 cls='reachable_candidate' if any(m in reach for m in mm) else 'listed_not_reached_or_data'
 if r['path'].endswith('.xci'):cls='vendor_ip_declared'
 if any(a.get('Name')=='AutoDisabled' and a.get('Val')=='1' for a in r['attrs']):cls+=';AutoDisabled'
 lines.append('\t'.join([r['set'],r['path'],str(r['exists']),cls,json.dumps(r['attrs'])]))
(out/'project_sources.tsv').write_text('\n'.join(lines)+'\n')
groups=collections.defaultdict(list)
for r in rows:
 if r['extension'] in ('.v','.sv','.vhd','.xci','.xdc','.mem','.tcl'):groups[r['sha256']].append(r['path'])
(out/'identical_files.json').write_text(json.dumps([v for v in groups.values() if len(v)>1],indent=2))
archive=Path('gt_ex.srcs/Keseluruhan Codingan SDAOISL10Gto10G 31 Oct 2026 (12.55 pm).zip')
comparison=[]
with zipfile.ZipFile(archive) as z:
 for n in z.namelist():
  if n.endswith('/'):continue
  data=z.read(n); h=hashlib.sha256(data).hexdigest(); same=[r['path'] for r in rows if r['sha256']==h]
  comparison.append({'member':n,'sha256':h,'identical_workspace_paths':same})
(out/'archive_comparison.json').write_text(json.dumps(comparison,indent=2))
summary={'file_count':len(rows),'extensions':dict(collections.Counter(r['extension'] for r in rows)),'manifest_sha256':hashlib.sha256(manifest.encode()).hexdigest(),'xpr_sha256':sha(Path('gt_ex.xpr')),'archive_sha256':sha(archive),'project_entries':len(sets),'missing':[r for r in sets if not r['exists']],'reachable_modules':len(reach),'archive_members':len(comparison),'archive_members_without_identical_file':len([r for r in comparison if not r['identical_workspace_paths']])}
(out/'summary.json').write_text(json.dumps(summary,indent=2));print(json.dumps(summary,indent=2))
with (out/'tools.log').open('w') as f:
 for cmd in [['iverilog','-V'],['vvp','-V'],['python3','--version'],['git','--version'],['git','rev-parse','HEAD'],['/tools/Xilinx/Vivado/2022.2/bin/vivado','-version']]:
  r=subprocess.run(cmd,capture_output=True,text=True);f.write('$ '+repr(cmd)+'\n'+r.stdout+r.stderr+f'\nexit={r.returncode}\n')
