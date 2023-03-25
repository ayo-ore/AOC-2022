#!/usr/bin/env julia
const INPUT_FILE = ARGS[1]
const inputs = transpose(hcat(
    [parse.(Int, collect(l)) for l ∈ eachline(INPUT_FILE)]...
))

function part_one(inputs)::Int
    N, M = size(inputs)
    sum(CartesianIndices(inputs)) do I
        i, j = Tuple(I)
        slices = [(1:i-1,j), (i+1:N,j), (i,1:j-1), (i, j+1:M)]
        any(all(inputs[s...] .< inputs[I]) for s ∈ slices)
    end
end

function part_two(inputs)::Int
    N, M = size(inputs)
    maximum(CartesianIndices(inputs)) do I
        i, j = Tuple(I)
        slices = [(i-1:-1:1, j), (i+1:N, j), (i, j-1:-1:1), (i, j+1:M)]
        dists = [findfirst(inputs[s...] .>= inputs[I]) for s ∈ slices]
        prod(zip(slices, dists)) do (s,d)
            isnothing(d) ? length(inputs[s...]) : d
        end
    end
end

println("PART ONE: $(part_one(inputs))")
println("PART TWO: $(part_two(inputs))")

