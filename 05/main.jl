#!/usr/bin/env julia
const INPUT_FILE = ARGS[1]

const lines::Vector{String} = readlines(INPUT_FILE)
const linebreak::Int = findfirst(isempty, lines)
const boxes::Matrix{Char} = vcat(
    [reshape(collect(line[2:4:end]), 1, :)
     for line ∈ lines[1:linebreak-2]]...
)
const stacks::Vector{Vector{Char}} = filter.(!=(' '), eachcol(boxes))

function part_one(stacks, lines, linebreak)::String
    for line ∈ lines[linebreak+1:end]
        num, src, dst = parse.(Int, split(line)[[2,4,6]]) 
        for _ in 1:num
            pushfirst!(stacks[dst], popfirst!(stacks[src]))
        end
    end
    reduce(*, getindex.(filter(!isempty, stacks), 1))
end

function part_one(stacks, lines, linebreak)::String
    for line ∈ lines[linebreak+1:end]
        num, src, dst = parse.(Int, split(line)[[2, 4, 6]])
        prepend!(stacks[dst], splice!(stacks[src], 1:num))
    end
    reduce(*, getindex.(filter(!isempty, stacks), 1))
end

println("PART ONE: $(part_one(stacks, lines, linebreak))")
println("PART TWO: $(part_two(stacks, lines, linebreak))")