include("Graph.jl")
include("Boruvka.jl")
include("Kruskal.jl")

myEdges= Edge[];

#UNCOMMENT ONE OF THE EXAMPLES BELOW
include("examples/cp-4.10.jl");
#include("examples/cp-4.14.jl")
#include("examples/k5.jl")
#include("examples/rail.jl")
#include("examples/tessellation.jl")

println("Given edges: ", myEdges);

println("--");

println("Boruvka");
(boruvkaEdges, boruvkaWeight) = @time boruvkaMST(myGraph);
println(boruvkaEdges);
println("Total Weight: ", boruvkaWeight);

println("--");

println("Kruskal");
(kruskalEdges, kruskalWeight) = @time boruvkaMST(myGraph);
println(kruskalEdges);
println("Total Weight: ", kruskalWeight);
