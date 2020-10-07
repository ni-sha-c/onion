using PyPlot
function f(x, s)
	h, a = s
	return h*sqrt(1 - abs(1 - 2*x)^a)
end
function prob(n,s)
	dens = zeros(n)
	dx = 1/n
	nsteps = 50000000
	x = rand()
	for i = 1:nsteps
		x = f(x, s)
		ind = floor(Int64, div(x, dx))
		dens[ind+1] += n/nsteps
	end
	return dens
end
fig = figure(figsize=(10,5))
ax = fig.add_subplot(111)
n = 50
s = [0.97,0.5]
dens = prob(n,s)
dx = 1/n
ax.plot(dx*(1:n), dens,label="s=0.5",lw=2.5)
s = [0.97,0.6]
dens = prob(n,s)
ax.plot(dx*(1:n), dens,label="s=0.6",lw=2.5)
s = [0.97,0.7]
dens = prob(n,s)
ax.plot(dx*(1:n), dens,label="s=0.7",lw=2.5)
s = [0.97,0.8]
dens = prob(n,s)
ax.plot(dx*(1:n), dens,label="s=0.8",lw=2.5)

ax.grid(true)
ax.xaxis.set_tick_params(labelsize=36)
ax.yaxis.set_tick_params(labelsize=36)
leg = ax.legend(fontsize=30,
    bbox_to_anchor=(0.,0.3,0.2,1.0))
