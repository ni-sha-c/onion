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
x0 = 0.1
eps = 1.e-2
x = LinRange(-eps, eps, npts)
s = [0.97, 0.6]
fig = figure(figsize=(8,5))
ax = fig.add_subplot(111)
nsteps = 5
xk = zeros(nsteps)
xk[1] = x0
for k = 1:nsteps-1
	ax.plot(x, phik.(x, x0, Ref(s), k-1).-xk[k], lw=2.0,
	label="\$ \\Phi^{$(k-1)}_{\\varphi^{$(k-1)}x_0} \$")
	xk[k+1] = f(xk[k], s)
end
ax.xaxis.set_tick_params(labelsize=24)
ax.yaxis.set_tick_params(labelsize=24)
ax.set_title(L"x_0 = 0.1",fontsize=28)
leg = ax.legend(fontsize=28,
	bbox_to_anchor=(0.,0.8,1.0,0.1),ncol=4)
ax.grid(true)
