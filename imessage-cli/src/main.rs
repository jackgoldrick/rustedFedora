use std::process::Command;
use clap::{App, Arg, SubCommand};
// use log::{info, error};
use simple_logger::SimpleLogger;

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
            .arg("scripts/send_text.scpt")
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


fn add_contact(name: &str, number: &str) -> Result<(), String> {
    let script = format!(
        r#"tell application "Messages"
        set targetService to 1st account
        send "{}" to participant  "{}" of targetService
        end tell"#,
       name, name
        // Also escape the handle
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

fn view_recent_message(contact: &str) -> Result<(), String> {
    let handle = get_contact_handle(contact)?
        .ok_or_else(|| format!("Contact '{}' not found.", contact))?;


        let output = Command::new("osascript")
        .arg("scripts/view_recent.scpt")
        .arg(handle)
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






fn main() {
    SimpleLogger::new().init().unwrap();

    let matches = App::new("iMessage CLI Utility")
        .version("1.0")
        .author("Jack Goldrick @MoDMAN200o")
        .about("Allows a user to use iMessage from the command line")
        .subcommand(
            SubCommand::with_name("send")
                .about("Send an iMessage")
                .short_flag('S')
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
                .short_flag('T'),
        )
        .subcommand(
            SubCommand::with_name("view_messages")
                .about("View recent messages from a contact")
                .short_flag('V')
                .arg(Arg::with_name("contact")
                    .help("Contact's name or phone number")
                    .required(true)
                    .index(1))
                .arg(Arg::with_name("length")
                    .help("Number of messages to view")
                    .short('l')
                    .default_value("10")),
        )
        .subcommand(
                    SubCommand::with_name("view_last_message")
                    .about("View the last message from a contact")
                    .short_flag('L')
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
        Some(("view_last_message", sub_m)) => {
            let contact = sub_m.value_of("contact").unwrap();
            match view_recent_message(contact) {
                Ok(()) => (),
                Err(err) => eprintln!("Failed to view messages: {}", err),
            }
        },
        _ => {
            println!("No valid subcommand was provided.");
        }
    }
}