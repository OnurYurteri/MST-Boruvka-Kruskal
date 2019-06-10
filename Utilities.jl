mutable struct Subset
    parent::Int
    rank::Int
end

function findSubset(subsets::Array{Subset}, i::Int)
    if (subsets[i].parent != i)
      subsets[i].parent =findSubset(subsets, subsets[i].parent);
    end
    return subsets[i].parent;
end

function UnionSubset(subsets::Array{Subset}, x::Int, y::Int)

    xroot = findSubset(subsets, x);
    yroot = findSubset(subsets, y);

    if (subsets[xroot].rank < subsets[yroot].rank)
        subsets[xroot].parent = yroot;
    elseif (subsets[xroot].rank > subsets[yroot].rank)
        subsets[yroot].parent = xroot;
    else
        subsets[yroot].parent = xroot;
        subsets[xroot].rank=subsets[xroot].rank+1;
    end
end
