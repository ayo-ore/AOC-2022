#!/usr/bin/julia
const INPUT_FILE = ARGS[1]
const calories = split.(split(read(INPUT_FILE, String), "\n\n"))

function part_one(calories)::Int
    maximum(c -> sum(parse.(Int, c)), calories)
end

function part_two(calories)::Int
    sum(sort(map(c -> sum(parse.(Int, c)), calories))[end-2:end])
end

println("PART ONE: $(part_one(calories))")
println("PART TWO: $(part_two(calories))")