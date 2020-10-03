import Base.+, Base.*

# Basic idea: Data structure to store a differential 1-form e.g. a contact form 
struct OneForm
	# mapping from R^3 to R^3 that represents a contact from. Input are three arguments and a single 3-component vector should be returned
	rep 
end

# the names should tell you everything
dx = OneForm((x,y,z) -> [1 0 0])
dy = OneForm((x,y,z) -> [0 1 0])
dz = OneForm((x,y,z) -> [0 0 1])

# addition of two contact forms
function (+)(a::OneForm, b::OneForm)
	return OneForm((x, y, z) -> a.rep(x,y,z) + b.rep(x,y,z))
end

# addition of a real number and a contact form
function (+)(a::Real, b::OneForm)
	return OneForm((x, y, z) -> a + b.rep(x,y,z))
end

# addition of a real number and a contact form
function (+)(a::OneForm, b::Real)
	return OneForm((x, y, z) -> a.rep(x,y,z) + b)
end

# addition of a real matrix and a contact form
function (+)(a::Matrix, b::OneForm)
	return OneForm((x, y, z) -> a + b.rep(x,y,z))
end

# addition of a real matrix and a contact form
function (+)(a::OneForm, b::Matrix)
	return OneForm((x, y, z) -> a.rep(x,y,z) + b)
end

# multiplication of a R^3 -> R function and a contact form 
function (*)(f::Function, a::OneForm)
	return OneForm((x,y,z) -> f(x,y,z) * a.rep(x,y,z))
end

# multiplication of a real number and a contact form 
function (*)(a::Real, b::OneForm)
	return OneForm((x,y,z) -> a * b.rep(x,y,z))
end
