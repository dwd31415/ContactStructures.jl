# the idea of this is to find a basis of the 
# kernel of matrix. This is done using the eigenvalues. 
function kernel_basis(A, tol = 1e-5)
	B = Array{Float64,1}[]
	kernel = nullspace(A);
	kernel_size = size(kernel)[2]
	for n = 1:kernel_size
		push!(B,kernel[:,n]);
	end
	return B
end
