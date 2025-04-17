# Default recipe
default:
    @just --list

# Install all dependencies
install:
    # Install Rust dependencies
    cargo install wasm-pack
    # Install Node.js dependencies
    npm install


# Build WASM
build-wasm:
    wasm-pack build --target web

# Build everything
build:
    npm run build
    just build-wasm

# Start the application (requires build)
start:
    electron .

# Run the application (builds first)
run: build start

# Development mode with hot-reload
dev:
    concurrently "tsc --watch" "electron ."

# Clean build artifacts
clean:
    # Remove TypeScript build output
    rm -rf dist/
    # Remove WASM build output
    rm -rf pkg/
    # Remove node_modules
    rm -rf node_modules/