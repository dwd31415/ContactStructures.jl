using Plots
using LinearAlgebra

function plot_plane(center, spanning_vector_a, spanning_vector_b, color=:grey, ε = 1/2, frame=false, frame_color=:blue)
	x = [center[1] + ε * spanning_vector_a[1] + ε * spanning_vector_b[1],
	     center[1] - ε * spanning_vector_a[1] + ε * spanning_vector_b[1],
	     center[1] + ε * spanning_vector_a[1] - ε * spanning_vector_b[1],
	     center[1] - ε * spanning_vector_a[1] - ε * spanning_vector_b[1]]
	
	y = [center[2] + ε * spanning_vector_a[2] + ε * spanning_vector_b[2],
	     center[2] - ε * spanning_vector_a[2] + ε * spanning_vector_b[2],
	     center[2] + ε * spanning_vector_a[2] - ε * spanning_vector_b[2],
	     center[2] - ε * spanning_vector_a[2] - ε * spanning_vector_b[2]]

	z = [center[3] + ε * spanning_vector_a[3] + ε * spanning_vector_b[3],
	     center[3] - ε * spanning_vector_a[3] + ε * spanning_vector_b[3],
	     center[3] + ε * spanning_vector_a[3] - ε * spanning_vector_b[3],
	     center[3] - ε * spanning_vector_a[3] - ε * spanning_vector_b[3]]
	
	if frame
		path3d!(x,y,z;color=frame_color)
	end
	mesh3d!(x,y,z;color,connections=([0,3],[1,2],[3,0]))
end

