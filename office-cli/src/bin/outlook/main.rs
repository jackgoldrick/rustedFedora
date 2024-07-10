use clap::{Arg, App};
use std::process::Command;
use std::io::{self, Write};
// open outlook takes the path to a outlook document and opens it in Microsoft outlook
fn open_outlook(path: Option<&str>) -> io::Result<()> {
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
                .arg("Microsoft Outlook")
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
                .arg("winoutlook")
                .spawn()?;
        } else if cfg!(target_os = "macos") {
            Command::new("open")
                .arg("-a")
                .arg("Microsoft Outlook")
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
    App::new("Outlook Opener")
        .version("1.0")
        .author("Jack Goldrick @MoDMAN200o")
        .about("Opens Microsoft Outlook with optional file path")
        .arg(Arg::with_name("path")
            .help("Path to Outlook document")
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
        
        if let Err(err) = open_outlook(Some(path)) {
            writeln!(io::stderr(), "Error: {}", err).unwrap();
            std::process::exit(1);
        }
    } else {
        if let Err(err) = open_outlook(None) {
            writeln!(io::stderr(), "Error: {}", err).unwrap();
            std::process::exit(1);
        }
    }
}
