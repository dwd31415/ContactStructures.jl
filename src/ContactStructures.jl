module ContactStructures

include("linear_algbra_helper.jl")
include("plot_plane.jl")
include("contact_form.jl")
include("contact_structure.jl")
include("plotter.jl")

export
	# to work with contact forms
	dx,dy,dy,
	# raw contact structures might also be useful
	ContactStructure,
	# and of course the standard one
	standard_structure,
	# the plot function
	plot_along_param_curve!,
	plot_along_param_curve,
	plot_along_xy_grid!,
	plot_along_xy_grid

end # module
