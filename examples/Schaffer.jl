# David Schaffer. Multiple Objective Optimization with Vector Evaluated Genetic Algorithms.
# In Proceedings of the 1st International Conference on Genetic Algorithms, 
# L. Erlbaum Associates Inc. pp. 93–100, 1985.
# http://dl.acm.org/citation.cfm?id=645511.657079

using NSGAII, PyPlot

function plot_pop(P)
    clf()
    P = filter(x->x.rank == 1, P)
    p = plot(map(x -> x.y[1], P), map(x -> x.y[2], P), "bo", markersize=1)
    show()
    sleep(0.1)
end

const d = BinaryCoding(6, [-10], [10])
z(x) = ( x[1]^2 , (x[1]-2)^2 )
nsga(200, 30, z, d, fplot = plot_pop)
