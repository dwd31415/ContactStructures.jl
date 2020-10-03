using Base.Iterators

function plot_along_param_curve!(curve, contact_str, step; midpoint_marker_color = :red, ε = 1.0, frame=false)
	ts = collect(0:step:1)
	points = curve.(ts)
	plt = nothing
	for (x,y,z) in points
		basis = contact_str.distribution(x,y,z)
		basis_a = normalize(basis[1,:])
		basis_b = normalize(basis[2,:])
		plt = plot_plane([x,y,z],basis_a,basis_b, :grey, ε, frame)
	end
	scatter3d!(plt,(x -> x[1]).(points),(x -> x[2]).(points),(x -> x[3]).(points), color=midpoint_marker_color)
	return plt
end

function plot_along_param_curve(curve, contact_str, step; midpoint_marker_color = :red, ε = 1.0)
	surface()
	plot_along_param_curve!(curve, contact_str, step; midpoint_marker_color, ε)
end

function plot_along_param_curve!(curve, contact_form :: OneForm, step; midpoint_marker_color = :red, ε = 1.0)
	plot_along_param_curve!(curve, structuralize_form(contact_form), step; midpoint_marker_color, ε)
end

function plot_along_param_curve(curve, contact_form :: OneForm, step; midpoint_marker_color = :red, ε = 1.0)
	plot_along_param_curve(curve, structuralize_form(contact_form), step; midpoint_marker_color, ε)
end

function plot_along_xy_grid!(xs, ys, z, contact_str; midpoint_marker_color = :red, ε = 1.0)
	grid = collect(product(xs,ys))
	plt = nothing
	for (x,y) in grid
		basis = contact_str.distribution(x,y,z)
		basis_a = normalize(basis[1,:])
		basis_b = normalize(basis[2,:])
		plt = plot_plane([x,y,z],basis_a,basis_b, :grey, ε)
	end
	print("A")
#	scatter3d!((x -> x[1]).(grid),(x -> x[2]).(grid),repeat([z], size(grid)...), color=midpoint_marker_color)
	return plt
end

function plot_along_xy_grid(xs, ys, z, contact_str; midpoint_marker_color = :red, ε = 1.0)
	surface()
	plot_along_xy_grid!(xs, ys, z, contact_str; midpoint_marker_color, ε)
end

function plot_along_xy_grid!(xs, ys, z, contact_form::OneForm; midpoint_marker_color = :red, ε = 1.0)
	plot_along_xy_grid!(xs, ys, z,structuralize_form(contact_form); midpoint_marker_color, ε)
end

function plot_along_xy_grid(xs, ys, z, contact_form::OneForm; midpoint_marker_color = :red, ε = 1.0)
	plot_along_xy_grid(xs, ys, z,structuralize_form(contact_form); midpoint_marker_color, ε)
end
