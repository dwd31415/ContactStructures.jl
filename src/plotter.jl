function plot_along_param_curve!(curve, contact_str, step; midpoint_marker_color = :red, ε = 1.0)
	ts = collect(0:step:1)
	points = curve.(ts)
	plt = nothing
	for (x,y,z) in points
		basis = contact_str.distribution(x,y,z)
		basis_a = normalize(basis[1,:])
		basis_b = normalize(basis[2,:])
		println(basis_a)
		println(basis_b)
		plt = plot_plane([x,y,z],basis_a,basis_b, :grey, ε)
	end
	scatter3d!(plt,(x -> x[1]).(points),(x -> x[2]).(points),(x -> x[3]).(points), color=midpoint_marker_color)
	return plt
end

function plot_along_param_curve(curve, contact_str, step; midpoint_marker_color = :red, ε = 1.0)
	surface()
	plot_along_param_curve!(curve, contact_str, step; midpoint_marker_color, ε)
end
