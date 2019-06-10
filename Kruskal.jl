include("Graph.jl")
include("Utilities.jl")

function kruskalMST(graph::Graph)
    V=graph.V;
    edges=graph.edges;
    result=Edge[];
    iter=1;
    subsets=Subset[];
    MSTweight=0;
    sort!(myEdges, by = v -> v.weight, rev=false);
    for i=1:V
        push!(subsets,Subset(i,0));
    end
    while length(result) < V-1
        nextEdge=edges[iter];
        iter+=1;
        x=findSubset(subsets, nextEdge.src);
        y=findSubset(subsets, nextEdge.dest);
        if x != y
            push!(result,nextEdge);
            MSTweight= MSTweight + nextEdge.weight;
            UnionSubset(subsets, x, y);
        end
    end
    return result, MSTweight;
end
