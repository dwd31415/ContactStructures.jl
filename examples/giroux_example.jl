using ContactStructures
using Plots

f = (x,y,z) -> cos(2π*x)
g = (x,y,z) -> sin(2π*x)
giroux_form = f * dz + g * dy 

plotly()
plot_along_xy_grid(0:0.125:1,0:0.125:1,0,giroux_form;  markersize = 0,ε = 0.05)
plot!(xlims=(-0.1, 1.1), ylims=(-0.1,1.1), zlims=(-0.6,0.6),legend=false)
