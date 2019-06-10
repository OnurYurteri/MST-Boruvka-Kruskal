struct Edge
    src::Int
    dest::Int
    weight::Int
end

struct Graph
    V::Int
    E::Int
    edges::Array{Edge}
end
