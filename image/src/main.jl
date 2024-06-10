using Pkg
Pkg.add("JSON3")
using JSON3
# Pkg.precompile()


function handler()
    arr = rand(0:9, 3, 3)
    response = Dict(
        "statusCode" => 200,
        "body" => Dict(
            "message" => "Hello, Phillip from Lambda!",
            "array" => arr
        )
    )
    return JSON3.json(response)
end

handler()
