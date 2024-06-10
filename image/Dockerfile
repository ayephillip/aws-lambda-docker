# Use the official Julia image as the base image
FROM public.ecr.aws/docker/library/julia:latest

# Set the JULIA_DEPOT_PATH environment variable to a directory with write permissions
ENV JULIA_DEPOT_PATH=${LAMBDA_TASK_ROOT}/depot

# Create the directory for JULIA_DEPOT_PATH
RUN mkdir -p $JULIA_DEPOT_PATH

# Copy install.jl
COPY install.jl ${LAMBDA_TASK_ROOT}

# Add Julia packages using install.jl
RUN julia install.jl

# Copy all Julia source files into the container
COPY src/* ${LAMBDA_TASK_ROOT}

# # Install required Julia packages
# RUN julia -e 'using Pkg; Pkg.add("JSON3")'

# Set the command to run your Julia handler
CMD ["julia", "-e", "include(\"main.jl\")"]