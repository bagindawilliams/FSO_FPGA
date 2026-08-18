
close_sim

launch_sim

add_force {top/sys_clk_p} -radix hex {0 0ns} {1 2.5ns} -repeat 5ns
add_force {top/sys_clk_n} -radix hex {1 0ns} {0 2.5ns} -repeat 5ns

run 10us

