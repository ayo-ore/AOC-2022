#!/usr/bin/env julia
const INPUT_FILE = ARGS[1]
const inputs = read(INPUT_FILE, String)

function get_dirsizes(inputs)::Dict{String,Int}
    dirsizes = Dict{String,Int}()
    current_dir = ""
    for block in split(inputs, "\$ cd ")[2:end]
        blocklines = split(block, "\n")

        name = popfirst!(blocklines)

        if name == ".."
            current_dir = join(["/"; split(current_dir, "/")[2:end-1]], "/")
            current_dir = replace(current_dir, "//" => "/")
        else
            current_dir *= "/$(lstrip(name, '/'))"
            current_dir = replace(current_dir, "//" => "/")
            dirsizes[current_dir] = 0
 
            filesizes = filter(!isnothing, match.(r"(\d+) (?:[a-z]|\.)+", blocklines))
            dirsizes[current_dir] = sum(parse(Int, m.captures[]) for m ∈ filesizes; init=0)
        end
    end
    return dirsizes
end

function part_one(inputs)::Int
    dirsizes = get_dirsizes(inputs)
    sum(dirsizes) do (d1, _)
        size = sum(dirsizes) do (d2, s)
            startswith(d2, d1) && s
        end
        (size <= 100_000) && size
    end
end

function part_two(inputs)::Int
    dirsizes = get_dirsizes(inputs)
    
    total_dirsizes = Dict{String, Int}(
        d1 => sum(dirsizes) do (d2, s)
            startswith(d2, d1) && s
        end for (d1, _) ∈ dirsizes
    )    
    
    free_space = 70_000_000 - total_dirsizes["/"]
    minimum(
        filter(≥(30_000_000 - free_space),
        collect(values(total_dirsizes)))
    )
end

println("PART ONE: $(part_one(inputs))")
println("PART TWO: $(part_two(inputs))")

