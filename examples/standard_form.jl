using ContactStructures

plotlyjs()
# define a contact form for the standard contact structure
x = (x,y,z) -> x
std_form = dz + x * dy
plot_along_xy_grid(-2:0.5:2,-2:0.5:2,0,std_form;  markersize = 2.5,ε = 0.25)
plot!(xlims=(-3, 3), ylims=(-3,3), zlims=(-3,3),legend=false)  

