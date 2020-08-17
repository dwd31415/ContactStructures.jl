struct ContactStructure
	distribution # store the hyperplane dist. as R^3 -> R^6 function
end

# the standard contact structure (x_1 dx_2 + dx_3)
standard_structure = ContactStructure((x,y,z) -> [1 0 -y;0 1 0])
