#!/usr/bin/env julia
const INPUT_FILE = ARGS[1]
const inputs = map(eachline(INPUT_FILE)) do i
    m = match(r"addx (.+)", i)
    isnothing(m) ? nothing : parse(Int, m.captures[])
end

function part_one(inputs)::Int
    c, X = 1, 1
    queue, X_history = Int[], Int[]
    for op ∈ inputs
        append!(queue, isnothing(op) ? [0] : [0, op])
        while !isempty(queue)
            push!(X_history, X)
            c += 1
            X += popfirst!(queue)
        end 
    end
    sig_cycles = [20, 60, 100, 140, 180, 220]
    return sum(sig_cycles .* X_history[sig_cycles])
end

function part_two(inputs)::Int
    c, X = 1, 1
    queue = Int[]
    pixels = falses(240)
    for op ∈ inputs
        append!(queue, isnothing(op) ? [0] : [0, op])
        while !isempty(queue)
            if abs(mod(c, 40) - 1 - X) < 2
                pixels[c] = true
            end
            c += 1
            X += popfirst!(queue)
        end
    end
    for l ∈ 1:6
        println(*(map(x -> x ? '#' : '.', pixels[1+40(l-1):40l])...))
    end
    return 0
end
println("PART ONE: $(part_one(inputs))")
println("PART TWO: $(part_two(inputs))")

