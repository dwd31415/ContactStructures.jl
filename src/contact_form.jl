# Basic idea: Data structure to store a differential 1-form e.g. a contact form 
# However that is kind of tricky I guess
struct OneForm
	rep :: array{float64,2}
end

dx = OneForm([1 0 0; 0 0 0; 0 0 0])
dy = OneForm([1 0 0; 0 0 0; 0 0 0])
dz = OneForm([0 0 0; 0 0 0; 0 0 1])
