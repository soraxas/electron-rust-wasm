use wasm_bindgen::prelude::*;
use std::process::Command;

#[wasm_bindgen]
pub fn add_numbers(a: i32, b: i32) -> i32 {
    a + b
}

#[wasm_bindgen]
pub fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}

#[wasm_bindgen]
pub fn launch_rust_program() -> String {
    match Command::new("./target/release/rust-program")
        .output() {
        Ok(output) => {
            if output.status.success() {
                String::from_utf8_lossy(&output.stdout).to_string()
            } else {
                String::from_utf8_lossy(&output.stderr).to_string()
            }
        },
        Err(e) => format!("Failed to launch program: {}", e)
    }
}