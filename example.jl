### A Pluto.jl notebook ###
# v0.11.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 0d8fcf0a-d89a-11ea-2bce-970fe8b59882
using Plots

# ╔═╡ 526ba17a-d898-11ea-2df2-c5d8e7b245d6
include("src/plot_hyperplane_dist.jl")

# ╔═╡ 3185d136-d89a-11ea-1375-1bec6ec35f8d
plotly()

# ╔═╡ dd95f404-d89a-11ea-3448-ed75ef59dace
function normalize(vec)
	return vec ./ sqrt(sum(vec.^2))
end

# ╔═╡ bf94353c-d898-11ea-0f91-952580e48e4b
begin
	md"""
	A: 
	
	$(@bind a_x html"<input type=range min=-1 max=1 step=0.1>")
	$(@bind a_y html"<input type=range min=-1 max=1 step=0.1>")
	$(@bind a_z html"<input type=range min=-1 max=1 step=0.1>")
	
	B: 
	
	$(@bind b_x html"<input type=range min=-1 max=1 step=0.1>")
	$(@bind b_y html"<input type=range min=-1 max=1 step=0.1>")
	$(@bind b_z html"<input type=range min=-1 max=1 step=0.1>")
	"""
end

# ╔═╡ 4477929e-d899-11ea-0ece-3b8e36c1afe5
begin
	a = [a_x,a_y,a_z];
	b = [b_x,b_y,b_z];
end

# ╔═╡ adb2a9aa-d89a-11ea-1035-9bbfae0d8e82
begin
	surface();
	md"$(plot_plane([0,0,0],normalize(a),normalize(b)))"
end

# ╔═╡ Cell order:
# ╠═0d8fcf0a-d89a-11ea-2bce-970fe8b59882
# ╠═3185d136-d89a-11ea-1375-1bec6ec35f8d
# ╠═526ba17a-d898-11ea-2df2-c5d8e7b245d6
# ╠═dd95f404-d89a-11ea-3448-ed75ef59dace
# ╟─bf94353c-d898-11ea-0f91-952580e48e4b
# ╟─4477929e-d899-11ea-0ece-3b8e36c1afe5
# ╠═adb2a9aa-d89a-11ea-1035-9bbfae0d8e82
