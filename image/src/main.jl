using Random
using JSON
using HTTP

function handler(req)
    arr = rand(0:9, 3, 3)
    response = Dict(
        "statusCode" => 200,
        "body" => Dict(
            "message" => "Hello, Phillip from Lambda!",
            "array" => arr
        )
    )
    return HTTP.Response(200, JSON.json(response))
end

HTTP.serve(handler, "0.0.0.0", 8080)
