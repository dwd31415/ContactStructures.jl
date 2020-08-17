include("./src/plotter.jl")
include("./src/plot_hyperplane_dist.jl")
include("src/contact_structure.jl")

plotly()
plot_along_param_curve(t -> (5t-2.5,5t-2.5,0), standard_structure, 0.125;  midpoint_marker_color=:red, ε=0.7)
plot!(xlims=(-3, 3), ylims=(-3,3), zlims=(-3,3))
savefig("standard_contact_str_r3.html")
