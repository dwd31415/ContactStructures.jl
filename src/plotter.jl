function plot_along_param_curve!(curve, contact_str, step)
	ts = collect(0:step:1)
	points = curve.(ts)
	plt = nothing
	for (x,y,z) in points
		basis = contact_str.distribution(x,y,z)
		plt = plot_plane([x,y,z],normalize(basis[1,:]),normalize(basis[2,:]))
	end
	return plt
end

function plot_along_param_curve(curve, contact_str, step)
	surface()
	plot_along_param_curve!(curve, contact_str, step)
end
