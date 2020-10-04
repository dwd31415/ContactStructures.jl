using ContactStructures
using Plots

f = (x,y,z) -> cos(2π*x)
g = (x,y,z) -> sin(2π*x)
giroux_form = f * dz + g * dy 

plotly()
plot_along_xy_grid(-1:0.25:1,-1:0.25:1,0,giroux_form;  markersize = 2.5,ε = 0.1, frame=true)
plot!(xlims=(-3, 3), ylims=(-3,3), zlims=(-3,3),legend=false)
