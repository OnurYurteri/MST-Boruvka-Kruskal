include("Graph.jl")
include("Utilities.jl")

function boruvkaMST(graph::Graph)
    V=graph.V;
    E=graph.E;
    edges=graph.edges;
    subsets=Subset[];
    cheapest=Int[];
    result=Edge[];
    for i=1:V
        push!(subsets,Subset(i,0));
        push!(cheapest, -1);
    end
    numTrees=V;
    MSTweight=0;
    while numTrees>1
        for i=1:V
            cheapest[i]=-1;
        end
        for i=1:E
            set1= findSubset(subsets,edges[i].src);
            set2= findSubset(subsets,edges[i].dest);
            if set1 != set2
                if cheapest[set1] == -1 || edges[cheapest[set1]].weight > edges[i].weight
                    cheapest[set1]=i;
                end
                if cheapest[set2] == -1 || edges[cheapest[set2]].weight > edges[i].weight
                    cheapest[set2]=i;
                end
            end
        end
        for i=1:V
            if cheapest[i] != -1
                set1=findSubset(subsets,edges[cheapest[i]].src);
                set2=findSubset(subsets,edges[cheapest[i]].dest);
                if set1 != set2
                    MSTweight= MSTweight + edges[cheapest[i]].weight;
                    push!(result,Edge(edges[cheapest[i]].src,edges[cheapest[i]].dest,edges[cheapest[i]].weight))
                    UnionSubset(subsets,set1,set2);
                    numTrees=numTrees-1;
                end
            end
        end
    end
    return result, MSTweight;
end
