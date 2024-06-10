# Use the official Julia image as the base image
FROM julia:1.7.0

# Set the JULIA_DEPOT_PATH environment variable to a directory with write permissions
ENV JULIA_DEPOT_PATH="/usr/local/julia"

# Set the working directory
WORKDIR /usr/src/app

# Copy your Julia code into the container (assuming it's in the same directory as your Dockerfile)
COPY src/* .

# Install required Julia packages
RUN julia -e 'using Pkg; Pkg.add("JSON"); Pkg.add("HTML")'

# Set the entry point to the Julia REPL
ENTRYPOINT ["julia"]

# Set the command to run your Julia script
CMD ["-e", "include(\"main.jl\"); \
            HTTP.serve(handler, \"0.0.0.0\", 8080)"]