#!/usr/bin/env julia
const INPUT_FILE = ARGS[1]
const chars = readline(INPUT_FILE)

function part_one(chars)::Int
    return 3 + findfirst([length(Set(chars[i-3:i])) == 4 for i ∈ 4:length(chars)])
end
function part_two(chars)::Int
    return 13 + findfirst([length(Set(chars[i-13:i])) == 14 for i ∈ 14:length(chars)])
end
println("PART ONE: $(part_one(chars))")
println("PART TWO: $(part_two(chars))")

