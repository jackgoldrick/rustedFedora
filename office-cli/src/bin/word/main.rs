use clap::{App, Arg};
use std::process::Command;
use std::io::{self, Write};

fn open_word(path: Option<&str>) -> io::Result<()> {
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
                .arg("Microsoft Word")
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
                .arg("winword")
                .spawn()?;
        } else if cfg!(target_os = "macos") {
            Command::new("open")
                .arg("-a")
                .arg("Microsoft Word")
                .spawn()?;
        } else {
            writeln!(io::stderr(), "Unsupported platform").unwrap();
            std::process::exit(1);
        }
    }
    
    Ok(())
}

fn get_args() -> clap::ArgMatches {
    App::new("Word Opener")
        .version("1.0")
        .author("Jack Goldrick @MoDMAN200o")
        .about("Opens Microsoft Word with optional file path")
        .arg(Arg::with_name("path")
            .help("Path to Word document")
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
        
        if let Err(err) = open_word(Some(path)) {
            writeln!(io::stderr(), "Error: {}", err).unwrap();
            std::process::exit(1);
        }
    } else {
        if let Err(err) = open_word(None) {
            writeln!(io::stderr(), "Error: {}", err).unwrap();
            std::process::exit(1);
        }
    }
}
