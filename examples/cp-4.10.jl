#CP 4.10
push!(myEdges, Edge(1,3,4))
push!(myEdges, Edge(1,2,4))
push!(myEdges, Edge(1,4,6))
push!(myEdges, Edge(1,5,6))
push!(myEdges, Edge(2,3,2))
push!(myEdges, Edge(3,4,8))
push!(myEdges, Edge(4,5,9))
myGraph=Graph(5,length(myEdges), myEdges)
