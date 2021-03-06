struct ContactStructure
	distribution # store the hyperplane dist. as R^3 -> R^6 function
end

# the standard contact structure (x_1 dx_2 + dx_3)
standard_structure = ContactStructure((x,y,z) -> [0 1 -x;1 0 0]) 

# @TODO: Turn into something nicer
function structuralize_form(α::OneForm)
	ContactStructure((x,y,z) -> extract_from_oneform(α,x,y,z))
end

function extract_from_oneform(α::OneForm,x,y,z, tol = 1e-4)
	mat = [α.rep(x,y,z); α.rep(x,y,z); α.rep(x,y,z)]
	basis = kernel_basis(mat)
	if length(basis) != 2
		throw_error = true
		# check if the vectors are not actually the same solution twice 
		if length(basis) == 3
			for i ∈ [1,2,3]
				for j ∈ setdiff([1,2,3],i)
					if sum(abs.(basis[i]-basis[j])) < tol || sum(abs.(basis[i]+basis[j])) < tol 
						throw_error = false
						# Make sure that the two unique vectors are the output
						basis[1], basis[2] = basis[i], basis[setdiff([1,2,3],[i,j])[1]]
						break
					end
				end
			end
		end
		if throw_error
			throw(ArgumentError("'Contact form' has kernel of dimension $(length(basis)) which is wrong. Must be 2."))
		else 
			return [transpose(basis[1]);transpose(basis[2])]
		end
	else
		return [transpose(basis[1]);transpose(basis[2])]
	end
end
