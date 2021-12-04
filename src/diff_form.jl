using AbstractAlgebra
using Zygote


struct ZeroForm 
   rep  :: Function
   name :: String 
end

Coefficent = Union{Function, Real}

struct OneForm 
	primitive :: ZeroForm 
end

struct HigherForm 
   components 	:: Array{Union{HigherForm, ZeroForm}}
   coeffs 	:: Array{Coefficent}
   exact 	:: Bool
   degree 	:: Int64
end
