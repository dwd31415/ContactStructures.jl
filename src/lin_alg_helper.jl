# the idea of this is to find a basis of the 
# kernel of matrix. This is done using the eigenvalues. 
function kernel_basis(A, tol = 1e-5)
	B = Array{Float64,1}[]
	λ_array, vecs = eigen(A)
	for idx in 1:length(λ_array)
		λ = λ_array[idx]
		if abs(λ) < tol
			push!(B, vecs[:,idx])
		end
	end
	return B
end
