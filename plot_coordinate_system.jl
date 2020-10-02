using PyPlot
function f(x, s)
	h, a = s
	return h*sqrt(1 - abs(1 - 2*x)^a)
end
function z(x, s)
	h, a = s
	t = f(x, s)/h
	x1 = abs(1 - 2*x)
	dt = 1/t*a*(x1^(a-1))
	return abs(h*dt)
end
function phik(xi, x, s, k)
	if k == 0
	 	return x+xi
	end
	zx = z(x,s)
	return f(phik(xi*zx, x, s, k-1),s)
end
npts = 100
x0 = 0.2
eps = 1.e-2
x = LinRange(-eps, eps, npts)
s = [0.97, 0.6]
fig = figure(figsize=(8,5))
ax = fig.add_subplot(111)
nsteps = 6
xk = zeros(nsteps)
xk[1] = x0
for k = 1:nsteps-1
	ax.plot(x, phik.(x, x0, Ref(s), k-1).-xk[k], 
			label="k = $(k-1)")
	xk[k+1] = f(xk[k], s)
end
ax.xaxis.set_tick_params(labelsize=28)
ax.yaxis.set_tick_params(labelsize=28)
ax.legend(fontsize=28)
ax.grid(true)
