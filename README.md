# Electron Rust WASM Example

This is a template project demonstrating how to integrate Rust WASM with Electron using TypeScript.

## Prerequisites

- Node.js and npm
- Rust and wasm-pack
- TypeScript
- Just (command runner)

## Installation

1. Install Just (if not already installed):
```bash
# On Arch Linux
sudo pacman -S just
# On Ubuntu/Debian
sudo apt install just
# On macOS
brew install just
```

2. Install project dependencies:
```bash
just install
```

## Building and Running

1. Build the project:
```bash
just build
```

2. Start the application:
```bash
just start
```

For development with hot-reload:
```bash
just dev
```

To clean build artifacts:
```bash
just clean
```

## Project Structure

- `src/lib.rs`: Rust code with WASM bindings
- `src/main.ts`: Electron main process
- `index.html`: Frontend interface
- `pkg/`: Generated WASM package (created after build)
- `justfile`: Build and development recipes

## Example Functions

The project includes two example functions:

1. `add_numbers(a: i32, b: i32) -> i32`: Adds two numbers
2. `greet(name: &str) -> String`: Returns a greeting message

## License

MIT