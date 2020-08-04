using Makie

function plot_plane(center, spanning_vector_a, spanning_vector_b, color=:grey, ε = 1)
	x = [center[1]-ε*spanning_vector_a[1]-ε*spanning_vector_b[1],center[1]+ε*spanning_vector_a[1]+ε*spanning_vector_b[1],
	     center[1]-2ε*spanning_vector_b[1],center[1]+2ε*spanning_vector_a[1]]
	y = [center[2]-ε*spanning_vector_a[2]-ε*spanning_vector_b[2],center[2]+ε*spanning_vector_a[2]+ε*spanning_vector_b[2],
	     center[2]-2ε*spanning_vector_b[2],center[2]+2ε*spanning_vector_a[2]]
	z = [center[3]-ε*spanning_vector_a[3]-ε*spanning_vector_b[3],center[3]+ε*spanning_vector_a[3]+ε*spanning_vector_b[3],
	     center[3]-2ε*spanning_vector_b[3],center[3]+2ε*spanning_vector_a[3]]

	indices = [1,2,3, 
		   3,2,4]

	mesh(x, y, z, indices, color = color)
end
