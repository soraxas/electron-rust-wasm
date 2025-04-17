# Default recipe
default:
    @just --list

# Install all dependencies
install:
    # Install Rust dependencies
    cargo install wasm-pack
    # Install Node.js dependencies
    npm install

# Build TypeScript
build-ts:
    npm run build

# Build WASM
build-wasm:
    wasm-pack build --target web

# Build Rust binary
build-rust:
    cargo build --release
    # Copy the binary to the project root
    cp target/release/rust-program .

# Build everything
build: build-ts build-wasm build-rust

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
    # Remove Rust build artifacts
    cargo clean
    # Remove copied binary
    rm -f rust-program