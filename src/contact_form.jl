import Base.+, Base.*

# Basic idea: Data structure to store a differential 1-form e.g. a contact form 
# However that is kind of tricky I guess
struct OneForm
	rep 
end

dx = OneForm((x,y,z) -> [1 0 0])
dy = OneForm((x,y,z) -> [0 1 0])
dz = OneForm((x,y,z) -> [0 0 1])

function (+)(a::OneForm, b::OneForm)
	return OneForm((x, y, z) -> a.rep(x,y,z) + b.rep(x,y,z))
end

function (+)(a::Real, b::OneForm)
	return OneForm((x, y, z) -> a + b.rep(x,y,z))
end

function (+)(a::OneForm, b::Real)
	return OneForm((x, y, z) -> a.rep(x,y,z) + b)
end

function (+)(a::Matrix, b::OneForm)
	return OneForm((x, y, z) -> a + b.rep(x,y,z))
end

function (+)(a::OneForm, b::Matrix)
	return OneForm((x, y, z) -> a.rep(x,y,z) + b)
end

function (*)(f::Function, a::OneForm)
	return OneForm((x,y,z) -> f(x,y,z) * a.rep(x,y,z))
end
