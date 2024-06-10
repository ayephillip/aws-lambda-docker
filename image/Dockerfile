# Use the official Julia image as the base image
FROM public.ecr.aws/docker/library/julia:latest

# Set the working directory
WORKDIR ${LAMBDA_TASK_ROOT}

# Copy all Julia source files into the container
COPY src/ ${LAMBDA_TASK_ROOT}

# Set the JULIA_DEPOT_PATH environment variable to a directory with write permissions
ENV JULIA_DEPOT_PATH=${LAMBDA_TASK_ROOT}/depot

# Create the directory for JULIA_DEPOT_PATH
RUN mkdir -p $JULIA_DEPOT_PATH

# Add Julia packages using install.jl
RUN julia install.jl

# Set the command to run your Julia handler
CMD ["julia", "-e", "include(\"main.jl\"); \
                      HTTP.serve(handler, \"0.0.0.0\", 8080)"]