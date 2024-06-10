using JSON

function handler()

    arr = rand(0:9, 3, 3)
    response = Dict(
        "statusCode" => 200,
        "body" => Dict(
            "message" => "Hello, Phillip from Lambda!",
            "array" => arr
        )
    )
    return JSON.json(response)
end

handler()
