/* /* use std::process::Command;

fn send_imessage(recipient: &str, message: &str) -> Result<(), String> {
    // Escape double quotes in the message content
    let escaped_message = message.replace("\"", "\\\"");

    // AppleScript command to send an iMessage
    let script = format!(
        r#"tell application "Messages"
               set targetService to 1st service whose service type = iMessage
               set targetBuddy to buddy "{}" of targetService
               send "{}" to targetBuddy
           end tell"#,
        recipient, escaped_message
    );

    // Execute the AppleScript using osascript command
    let output = Command::new("osascript")
        .arg("-e")
        .arg(&script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    // Check if execution was successful
    if output.status.success() {
        Ok(())
    } else {
        Err(format!(
            "Command failed with code {}: {}",
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}

/* 




*/
fn get_args() -> clap::ArgMatches {
    App::new("iMessage CLI Utility")
        .version("1.0")
        .author("Jack Goldrick @MoDMAN200o")
        .about("Allows a user to use iMessage from the command line")
        // .arg(Arg::with_name("path")
        //     .help("Path to PowerPoint document")
        //     .index(1))
        // .get_matches()
        
}





fn main() {
    let recipient = "+1 (757) 749-8405"; // Replace with recipient's phone number (with country code if necessary)
    let message = "Hello from Rust!"; // Message content

    match send_imessage(recipient, message) {
        Ok(()) => println!("Message sent successfully."),
        Err(err) => eprintln!("Failed to send message: {}", err),
    }
}
 */

 use std::process::Command;
use clap::{App, Arg, SubCommand};
use strsim::levenshtein;
use log::{info, error};
use simple_logger::SimpleLogger;

fn get_contact(name: &str) -> Result<Option<String>, String> {
    let escaped_name = name.replace("\"", "\n"); // Escaping double quotes for AppleScript
    let script = format!(
        r#"tell application "Contacts"
            set matchedContacts to every person whose name contains[c] "{}"
            if (count of matchedContacts) > 0 then
                return name of item 1 of matchedContacts
            else
                return "\n"
            end tell"#,
        escaped_name
    );

    let output = Command::new("osascript")
        .arg("-e")
        .arg(script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        let result_name = String::from_utf8_lossy(&output.stdout).trim().to_string();
        if result_name.is_empty() {
            Ok(None)
        } else {
            Ok(Some(result_name))
        }
    } else {
        let error_message = format!("Command failed with code {}: {}", 
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr));
        Err(error_message)
    }
}


fn send_imessage(recipient: &str, message: &str) -> Result<(), String> {
    // First, retrieve the exact contact name
    match get_contact(recipient)? {
        Some(exact_name) => {
            // Command components
            let script = r#"
                tell application "Messages"
                    set targetService to 1st service whose service type is iMessage
                    set targetBuddy to buddy "{recipient}" of targetService
                    send "{message}" to targetBuddy
                end tell
            "#;

            // Prepare to execute AppleScript
            let output = Command::new("osascript")
                .arg("-e")
                .arg(script.replace("{recipient}", &exact_name.replace("\"", "\\\""))
                           .replace("{message}", &message.replace("\"", "\\\"")))
                .output()
                .map_err(|e| format!("Failed to execute command: {}", e))?;

            if output.status.success() {
                Ok(())
            } else {
                let error_message = format!("Command failed with code {}: {}",
                    output.status.code().unwrap_or(-1),
                    String::from_utf8_lossy(&output.stderr));
                Err(error_message)
            }
        },
        None => Err(format!("Contact '{}' not found.", recipient))
    }
}






fn add_contact(name: &str, number: &str) -> Result<(), String> {
    let script = format!(
        r#"tell application "Contacts"
               set newContact to make new person with properties {{first name:"{}"}}
               make new phone at end of phones of newContact with properties {{label:"mobile", value:"{}"}}
           end tell"#,
        name, number
    );

    info!("Adding contact...");
    let output = Command::new("osascript")
        .arg("-e")
        .arg(&script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        info!("Contact added successfully.");
        Ok(())
    } else {
        error!("Failed to add contact.");
        Err(format!(
            "Command failed with code {}: {}",
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}

fn view_threads() -> Result<(), String> {
    let script = r#"tell application "Messages"
                       set threadList to {}
                       repeat with aChat in chats
                           set end of threadList to name of aChat
                       end repeat
                       return threadList
                   end tell"#;

    info!("Viewing threads...");
    let output = Command::new("osascript")
        .arg("-e")
        .arg(script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        let threads = String::from_utf8_lossy(&output.stdout);
        println!("Threads: \n{}", threads);
        Ok(())
    } else {
        error!("Failed to view threads.");
        Err(format!(
            "Command failed with code {}: {}",
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}

fn view_recent_messages(contact: &str) -> Result<(), String> {
    let script = format!(
        r#"tell application "Messages"
               set targetChat to first chat whose name contains "{}"
               set recentMessages to {{}}
               repeat with aMessage in (get recent messages of targetChat)
                   set end of recentMessages to (text of aMessage)
               end repeat
               return recentMessages
           end tell"#,
        contact
    );

    info!("Viewing recent messages for contact: {}", contact);
    let output = Command::new("osascript")
        .arg("-e")
        .arg(&script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        let messages = String::from_utf8_lossy(&output.stdout);
        println!("Recent messages from {}: \n{}", contact, messages);
        Ok(())
    } else {
        error!("Failed to view recent messages.");
        Err(format!(
            "Command failed with code {}: {}",
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}



fn suggest_contact(input: &str, contacts: &[String]) -> Option<String> {
    contacts.iter()
        .map(|contact| (contact, levenshtein(input, contact)))
        .min_by_key(|&(_, distance)| distance)
        .filter(|&(_, distance)| distance <= 3) // Suggest if the distance is reasonably close
        .map(|(contact, _)| contact.clone())
}

fn main() {
    SimpleLogger::new().init().unwrap();

    let matches = App::new("iMessage CLI Utility")
        .version("1.0")
        .author("Jack Goldrick @MoDMAN200o")
        .about("Allows a user to use iMessage from the command line")
        .subcommand(
            SubCommand::with_name("send")
                .about("Send an iMessage")
                .arg(Arg::with_name("recipient")
                    .help("Recipient's phone number or contact name")
                    .required(true)
                    .index(1))
                .arg(Arg::with_name("message")
                    .help("Message content")
                    .required(true)
                    .index(2)),
        )
        .subcommand(
            SubCommand::with_name("add_contact")
                .about("Add a new contact")
                .arg(Arg::with_name("name")
                    .help("Contact's name")
                    .required(true)
                    .index(1))
                .arg(Arg::with_name("number")
                    .help("Contact's phone number")
                    .required(true)
                    .index(2)),
        )
        .subcommand(
            SubCommand::with_name("view_threads")
                .about("View recent threads")
        )
        .subcommand(
            SubCommand::with_name("view_messages")
                .about("View recent messages from a contact")
                .arg(Arg::with_name("contact")
                    .help("Contact's name or phone number")
                    .required(true)
                    .index(1)),
        )
        .get_matches();

    match matches.subcommand() {
        Some(("send", sub_m)) => {
            let recipient = sub_m.value_of("recipient").unwrap();
            let message = sub_m.value_of("message").unwrap();
            match send_imessage(recipient, message) {
                Ok(()) => println!("Message sent successfully."),
                Err(err) => eprintln!("Failed to send message: {}", err),
            }
        },
        Some(("add_contact", sub_m)) => {
            let name = sub_m.value_of("name").unwrap();
            let number = sub_m.value_of("number").unwrap();
            match add_contact(name, number) {
                Ok(()) => println!("Contact added successfully."),
                Err(err) => eprintln!("Failed to add contact: {}", err),
            }
        },
        Some(("view_threads", _)) => {
            match view_threads() {
                Ok(()) => (),
                Err(err) => eprintln!("Failed to view threads: {}", err),
            }
        },
        Some(("view_messages", sub_m)) => {
            let contact = sub_m.value_of("contact").unwrap();
            match view_recent_messages(contact) {
                Ok(()) => (),
                Err(err) => eprintln!("Failed to view messages: {}", err),
            }
        },
        _ => {
            println!("No valid subcommand was provided.");
        }
    }
}
 */
use std::fs::File;
use std::io::Write;
use std::process::Command;
use clap::{App, Arg, SubCommand};
use log::{info, error};
use simple_logger::SimpleLogger;

/* fn get_contact_handle(name: &str) -> Result<Option<String>, String> {
    let escaped_name = name.replace("\"", "\\\""); // Escaping double quotes for AppleScript

    // Prepare the AppleScript command
    let script_content = format!(
        r#"tell application "Contacts"
            set matchedContacts to every person whose name contains "{}"
            if (count of matchedContacts) > 0 then
                return value of first phone of item 1 of matchedContacts
            else
                return ""
            end if
        end tell"#,
        escaped_name
    );

    // Write the script to a temporary file
    let mut file = File::create("/tmp/get_contact_handle.scpt").map_err(|e| format!("Failed to create script file: {}", e))?;
    write!(file, "{}", script_content).map_err(|e| format!("Failed to write to script file: {}", e))?;

    // Execute the script file
    let output = Command::new("osascript")
        .arg("/tmp/get_contact_handle.scpt")
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        let result_handle = String::from_utf8_lossy(&output.stdout).trim().to_string();
        if result_handle.is_empty() {
            Ok(None)
        } else {
            Ok(Some(result_handle))
        }
    } else {
        let error_message = format!("Command failed with code {}: {}", 
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr));
        Err(error_message)
    }
} */

fn get_contact_handle(name: &str) -> Result<Option<String>, String> {
    let escaped_name = name.replace("\"", "\\\""); // Escaping double quotes for AppleScript
    let script = format!(
        r#"tell application "Contacts"
            set matchedContacts to every person whose name contains "{}"
            if (count of matchedContacts) > 0 then
                return value of first phone of item 1 of matchedContacts
            else
                return ""
            end if
        end tell"#,
        escaped_name
    );

    let output = Command::new("osascript")
        .arg("-e")
        .arg(script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        let result_name = String::from_utf8_lossy(&output.stdout).trim().to_string();
        if result_name.is_empty() {
            Ok(None)
        } else {
            Ok(Some(result_name))
        }
    } else {
        let error_message = format!("Command failed with code {}: {}", 
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr));
        Err(error_message)
    }
}


fn send_imessage(recipient: &str, message: &str) -> Result<(), String> {
    match get_contact_handle(recipient)? {
        Some(handle) => {
            let escaped_message = message.replace("\"", "\\\""); // Properly escape double quotes

            // Prepare the AppleScript command
/*             let script = format!(
                r#"tell application "Messages"
                set targetService to 1st account
                send "{}" to participant  "{}" of targetService
                end tell"#,
                escaped_message,
                handle
                // Also escape the handle
            );
 */
            // Print the script content for debugging
            // println!("AppleScript content:\n{}", script);

            let output = Command::new("osascript")
            .arg("src/send_text.scpt")
            .arg(handle)
            .arg(message)
            .output()
            .map_err(|e| format!("Failed to execute command: {}", e))?;

        if output.status.success() {
            Ok(())
        } else {
            let error_message = format!("Command failed with code {}: {}",
                output.status.code().unwrap_or(-1),
                String::from_utf8_lossy(&output.stderr));
            Err(error_message)
        }
        },
        None => Err(format!("Contact '{}' not found.", recipient))
    }
}


fn main() {
    SimpleLogger::new().init().unwrap();

    let matches = App::new("iMessage CLI Utility")
        .version("1.0")
        .author("Jack Goldrick @MoDMAN200o")
        .about("Allows a user to use iMessage from the command line")
        .subcommand(
            SubCommand::with_name("send")
                .about("Send an iMessage")
                .arg(Arg::with_name("recipient")
                    .help("Recipient's phone number or contact name")
                    .required(true)
                    .index(1))
                .arg(Arg::with_name("message")
                    .help("Message content")
                    .required(true)
                    .index(2)),
        )
        .subcommand(
            SubCommand::with_name("add_contact")
                .about("Add a new contact")
                .arg(Arg::with_name("name")
                    .help("Contact's name")
                    .required(true)
                    .index(1))
                .arg(Arg::with_name("number")
                    .help("Contact's phone number")
                    .required(true)
                    .index(2)),
        )
        .subcommand(
            SubCommand::with_name("view_threads")
                .about("View recent threads")
        )
        .subcommand(
            SubCommand::with_name("view_messages")
                .about("View recent messages from a contact")
                .arg(Arg::with_name("contact")
                    .help("Contact's name or phone number")
                    .required(true)
                    .index(1)),
        )
        .get_matches();

    match matches.subcommand() {
        Some(("send", sub_m)) => {
            let recipient = sub_m.value_of("recipient").unwrap();
            let message = sub_m.value_of("message").unwrap();
            match send_imessage(recipient, message) {
                Ok(()) => println!("Message sent successfully."),
                Err(err) => eprintln!("Failed to send message: {}", err),
            }
        },
        Some(("add_contact", sub_m)) => {
            let name = sub_m.value_of("name").unwrap();
            let number = sub_m.value_of("number").unwrap();
            match add_contact(name, number) {
                Ok(()) => println!("Contact added successfully."),
                Err(err) => eprintln!("Failed to add contact: {}", err),
            }
        },
        Some(("view_threads", _)) => {
            match view_threads() {
                Ok(()) => (),
                Err(err) => eprintln!("Failed to view threads: {}", err),
            }
        },
        Some(("view_messages", sub_m)) => {
            let contact = sub_m.value_of("contact").unwrap();
            match view_recent_messages(contact) {
                Ok(()) => (),
                Err(err) => eprintln!("Failed to view messages: {}", err),
            }
        },
        _ => {
            println!("No valid subcommand was provided.");
        }
    }
}

fn add_contact(name: &str, number: &str) -> Result<(), String> {
    let script = format!(
        r#"tell application "Contacts"
            set newContact to make new person with properties {{first name:"{}"}}
            make new phone at end of phones of newContact with properties {{label:"mobile", value:"{}"}}
        end tell"#,
        name, number
    );

    let output = Command::new("osascript")
        .arg("-e")
        .arg(&script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        Ok(())
    } else {
        Err(format!(
            "Command failed with code {}: {}",
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}

fn view_threads() -> Result<(), String> {
    let script = r#"tell application "Messages"
                       set threadList to {}
                       repeat with aChat in chats
                           set end of threadList to name of aChat
                       end repeat
                       return threadList
                   end tell"#;

    let output = Command::new("osascript")
        .arg("-e")
        .arg(script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        let threads = String::from_utf8_lossy(&output.stdout);
        println!("Threads: \n{}", threads);
        Ok(())
    } else {
        Err(format!(
            "Command failed with code {}: {}",
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}

fn view_recent_messages(contact: &str) -> Result<(), String> {
    let script = format!(
        r#"tell application "Messages"
               set targetChat to first chat whose name contains "{}"
               set recentMessages to {{}}
               repeat with aMessage in (get recent messages of targetChat)
                   set end of recentMessages to (text of aMessage)
               end repeat
               return recentMessages
           end tell"#,
        contact
    );

    let output = Command::new("osascript")
        .arg("-e")
        .arg(&script)
        .output()
        .map_err(|e| format!("Failed to execute command: {}", e))?;

    if output.status.success() {
        let messages = String::from_utf8_lossy(&output.stdout);
        println!("Recent messages from {}: \n{}", contact, messages);
        Ok(())
    } else {
        Err(format!(
            "Command failed with code {}: {}",
            output.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&output.stderr)
        ))
    }
}
