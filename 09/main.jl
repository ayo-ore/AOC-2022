#!/usr/bin/env julia
const INPUT_FILE = ARGS[1]
const inputs = map(eachline(INPUT_FILE)) do i
    i[1] => parse(Int, i[3:end])
end

DIRMAP = Dict{Char, Vector{Int}}('U'=>[0,1], 'D'=>[0,-1], 'L'=>[-1,0], 'R'=>[1,0])
function part_one(inputs)::Int
    H = zeros(Int, 2)
    T = zeros(Int, 2)
    v = similar(H)
    s = similar(H)
    visited = Set([Tuple(T)])
    for move in inputs
        v .= DIRMAP[move.first]
        for _ in 1:move.second    
            H .+= v
            s .= H .- T
            if hypot(s...) > sqrt(2)
                T .+= sign.(s)
            end
            push!(visited, Tuple(T))
        end
    end
    return length(visited)
end

function part_two(inputs)::Int
    knots = [zeros(Int, 2) for _ in 1:10]
    v = similar(knots[1])
    s = similar(v)
    visited = Set([Tuple(knots[end])])
    for head_move in inputs        
        for _ in 1:head_move.second
            v .= DIRMAP[head_move.first]
            for i in 2:length(knots)
                knots[i-1] .+= v
                s .= knots[i-1] .- knots[i]
                v.= hypot(s...) > sqrt(2) ? sign.(s) : v .= zeros(Int, 2)
                if i == length(knots)
                    knots[i] .+= v
                    push!(visited, Tuple(knots[i]))
                end
            end
        end
    end
    return length(visited)
end
println("PART ONE: $(part_one(inputs))")
println("PART TWO: $(part_two(inputs))")

