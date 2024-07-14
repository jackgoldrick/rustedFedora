use std::process::Command;
use clap::{App, Arg, SubCommand};
use regex::Regex;
use simple_logger::SimpleLogger;
use term_size;
// use cow_utils::CowUtils;
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


fn add_contact(name: &str, _number: &str) -> Result<(), String> {
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
/* This Function will take in a double newline delimitted string of messages.
   This function will reverse the order of the lines such that the first message
   line is first and so on. Also, this function will right justify the lines that contain Me.
   Right Justify is not enough, to ensure that the messages are readable, the function should
   ensure that all message begin from the same horizontal position. If the message is too long
   the function should wrap the message to the next line. The message should be wrapped  and begin 
   at the same horizontal position as the first line of the message. The message should b
   In addition, this function will replace the phone number with the contact name.
   Also, this function should remove any Me or the contact name from the message 
   if there are multiple lines with the same name.
   The output will be a string with the new order and formatting.
     */

     
     fn format_message_thread(msg_thread: &str, contact: &str) -> String {
        let normalized_threads = msg_thread
            .replace("|", ": ");
    
            // .replace("\r\r", "\n")
            // .replace("\r\n", "\n")
            // .replace("\r", "\n")
        let re = Regex::new(r"\+\d{10,15}:").unwrap();
        let prepped_thread = re.replace_all(&normalized_threads, format!("{}:", contact));
    
        let width = term_size::dimensions().map_or(80, |(w, _)| w);
        let wrap_threshold = (width as f32 * 0.42) as usize; // 100% - 16% for empty space
    
        let mut formatted_message = String::new();
    
        // Collect lines into a vector
        let mut lines: Vec<&str> = prepped_thread.split("\r").collect();
        // Reverse the order of the lines
        lines.reverse();
    
        for line in lines {
            if line.starts_with("Me:") {
                // Right justify "Me" messages
                let mut current_line = String::new();
                let mut current_line_length = 0;
    
                for word in line.split_whitespace() {
                    if current_line_length + word.len() + 1 > wrap_threshold  {
                        formatted_message.push_str(&format!("{:>width$}", current_line, width = width));
                        current_line.clear();
                        current_line_length = 0;
                    }
                    if !current_line.is_empty() {
                        current_line.push(' ');
                        current_line_length += 1;
                    }
                    current_line.push_str(word);
                    current_line_length += word.len();
                }
                if !current_line.is_empty() {
                    formatted_message.push_str(&format!("{:>width$}\n", current_line, width = width));
                }
            } else {
                // Apply existing logic for other messages
                let mut current_line_length = 0;
                for word in line.split_whitespace() {
                    if current_line_length + word.len() + 1 > wrap_threshold {
                        formatted_message.push('\n');
                        current_line_length = 0;
                    }
                    if current_line_length > 0 {
                        formatted_message.push(' ');
                        current_line_length += 1;
                    }
                    formatted_message.push_str(word);
                    current_line_length += word.len();
                }
                formatted_message.push('\n');
            }
        }
    
        formatted_message.trim_end().to_string()
    }
/*     let normalized_threads = msg_thread
                                                .replace("\r\r", "\n")
                                                .replace("\r\n", "\n")
                                                .replace("\r", "\n")
                                                .replace("|", ": ");

    let re = Regex::new(r"\+\d{10,15}\:").unwrap();
    let prepped_thread = re.replace_all(&normalized_threads, contact.to_owned() + ":");
    let mut formatted_thread = String::new();
    let mut lines: Vec<&str> = prepped_thread.split("\n").collect();
    lines.reverse();
    for line in lines {
        if line.contains("Me:") {
            formatted_thread.push_str(&format!("{:>1$}\n", line, 80));
        } else {
            formatted_thread.push_str(&format!("{}\n", line));
        }
    }
    return formatted_thread;

}  */

fn view_message_thread(contact: &str, size: &i32) -> Result<(), String> {
    match get_contact_handle(contact)? {
        Some(handle) => {
            let output = Command::new("osascript")
                .arg("scripts/view_messages.scpt")
                .arg(handle)
                .arg(size.to_string())
                .output()
                .map_err(|e| format!("Failed to execute command: {}", e))?;

            if output.status.success() {
                // Debugging: Print raw stdout to understand its structure
                // println!("Raw stdout: {:?}", String::from_utf8_lossy(&output.stdout));
                let formatted_thread: String = format_message_thread(&String::from_utf8_lossy(&output.stdout), contact);

                
                
                println!("Formatted Threads: \n\n{}", formatted_thread);
                Ok(())
            } else {
                Err(format!(
                    "Command failed with code {}: {}",
                    output.status.code().unwrap_or(-1),
                    String::from_utf8_lossy(&output.stderr)
                ))
            }
        },
        None => Err("Contact handle not found".to_string()),
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



        let messages = &String::from_utf8_lossy(&output.stdout);
        let normalized_threads = messages
            .replace("\r\r", "\n\n")
            .replace("\r\n", "\n\n")
            .replace("\r", "\n\n")
            .replace("|", ": ");
        println!("Recent message from {}: \n\n{}", contact, normalized_threads.to_string());
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
        .arg(Arg::with_name("contact")
            .help("Target Contact")
            .index(1))
        .subcommand(
            SubCommand::with_name("send")
                .about("Send an iMessage")
                .short_flag('S')
                .arg(Arg::with_name("message")
                    .help("Message content")
                    .required(true)
                    .index(1)),
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
                .arg(Arg::with_name("length")
                    .help("Number of messages to view")
                    .index(1)
                    .default_value("10")),
        )
        .subcommand(
                    SubCommand::with_name("view_last_message")
                    .about("View the last message from a contact")
                    .short_flag('L'))
        .get_matches();

    match matches.subcommand() {
        Some(("send", sub_m)) => {
            let recipient = matches.value_of("contact").unwrap();
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
        Some(("view_last_message", _)) => {
            let contact = matches.value_of("contact").unwrap();
            match view_recent_message(contact) {
                Ok(()) => (),
                Err(err) => eprintln!("Failed to view messages: {}", err),
            }
        },

        Some(("view_messages", sub_m)) => {
            let contact = matches.value_of("contact").unwrap();
            let size = sub_m.value_of("length").unwrap();
            let int_size = size.parse::<i32>().unwrap();
            // print!("{}", int_size);
            match view_message_thread(contact, &int_size) {
                Ok(()) => (),
                Err(err) => eprintln!("Failed to view messages: {}", err),
            }
        },
        _ => {
            println!("No valid subcommand was provided.");
        }
    }
}