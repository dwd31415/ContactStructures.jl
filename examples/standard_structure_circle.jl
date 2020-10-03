using ContactStructures

plotlyjs()
plot_along_param_curve(t -> (2*cos(2π*t),2*sin(2π*t),0), standard_structure, 0.0625;  midpoint_marker_color=:red, ε=0.35)
plot!(xlims=(-3, 3), ylims=(-3,3), zlims=(-3,3),legend=false)
