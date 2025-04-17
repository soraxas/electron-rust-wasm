use std::process::Command;

fn main() {
    println!("Hello from Rust binary!");

    // Example of running a system command
    let output = Command::new("ls")
        .arg("-l")
        .output()
        .expect("Failed to execute command");

    if output.status.success() {
        let stdout = String::from_utf8_lossy(&output.stdout);
        println!("Command output:\n{}", stdout);
    } else {
        let stderr = String::from_utf8_lossy(&output.stderr);
        eprintln!("Command failed:\n{}", stderr);
    }
}