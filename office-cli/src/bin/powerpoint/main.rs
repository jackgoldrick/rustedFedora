use clap::{Arg, App};
use std::process::Command;
use std::io::{self, Write};
// open powerpoint takes the path to a powerpoint document and opens it in Microsoft powerpoint
fn open_powerpoint(path: Option<&str>) -> io::Result<()> {
    if let Some(path) = path {
        if cfg!(target_os = "windows") {
            Command::new("cmd")
                .arg("/C")
                .arg("start")
                .arg(path)
                .spawn()?;
        } else if cfg!(target_os = "macos") {
            Command::new("open")
                .arg("-a")
                .arg("Microsoft PowerPoint")
                .arg(path)
                .spawn()?;
        } else {
            writeln!(io::stderr(), "Unsupported platform").unwrap();
            std::process::exit(1);
        }
    } else {
        if cfg!(target_os = "windows") {
            Command::new("cmd")
                .arg("/C")
                .arg("start")
                .arg("winpowerpoint")
                .spawn()?;
        } else if cfg!(target_os = "macos") {
            Command::new("open")
                .arg("-a")
                .arg("Microsoft PowerPoint")
                .spawn()?;
        } else {
            writeln!(io::stderr(), "Unsupported platform").unwrap();
            std::process::exit(1);
        }
    }
    
    Ok(())
}

// get_args returns the command line arguments for the program
fn get_args() -> clap::ArgMatches {
    App::new("PowerPoint Opener")
        .version("1.0")
        .author("Jack Goldrick @MoDMAN200o")
        .about("Opens Microsoft PowerPoint with optional file path")
        .arg(Arg::with_name("path")
            .help("Path to PowerPoint document")
            .index(1))
        .get_matches()
        
}

fn main() {
    let matches = get_args();
    if let Some(path) = matches.value_of("path") {
        if !std::path::Path::new(path).exists() {
            writeln!(io::stderr(), "File not found: {}", path).unwrap();
            std::process::exit(1);
        }
        
        if let Err(err) = open_powerpoint(Some(path)) {
            writeln!(io::stderr(), "Error: {}", err).unwrap();
            std::process::exit(1);
        }
    } else {
        if let Err(err) = open_powerpoint(None) {
            writeln!(io::stderr(), "Error: {}", err).unwrap();
            std::process::exit(1);
        }
    }
}
