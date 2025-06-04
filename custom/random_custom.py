from datetime import datetime
import os
from pathlib import Path
import subprocess
from talon import Module, actions, app, Context

NOTES_DIR = Path("/Users/rebec/Library/CloudStorage/Dropbox/DropboxDocuments/notes")
# NOTES_DIR.mkdir(exist_ok=True)

mod = Module()
is_mac = app.platform == "mac"

@mod.action_class
class Actions:
    def maybe_disable_speech_for_notes(path: str):
        """Conditionally run commands if the file is notes.md"""
        # Extract the filename using os.path.basename
        filename = os.path.basename(path)
        
        # Check if the filename is notes.md
        if filename == "journal.md" or filename == "physical_therapy_daily.md":
            # Insert date formatting
            actions.user.insert_current_date("%A, %B %d, %Y")
            actions.sleep("200ms")
            actions.key("enter:3")
            actions.sleep("200ms")
            actions.key("up:2")
            actions.sleep("100ms")
            
            actions.speech.disable()
            actions.key("alt-cmd-r")
        else:
            actions.key("enter:2")
            actions.key("up:2")
    
    def create_note():
        """Create a new note"""
        curtime = datetime.now().strftime("%Y-%m-%d-%H%M%S")
        file_path = NOTES_DIR / f"{curtime}.md"
        print(f"Creating note at {file_path}")
        file_path.touch()
        actions.sleep("500ms")
        print(f"Opening note at {file_path}")
        os.startfile(file_path, "open")
                
    # def edit_note(file_name: str):
    #     """Edit an existing note"""
    #     file_path = NOTES_DIR / file_name
    #     if file_path.exists():
    #         edit_file(file_path)
    #     else:
    #         actions.app.notify(f"Note {file_name} does not exist.")

    def append_to_daily_note_text(text: str):
        """Append provided text to daily note"""
        file_path = NOTES_DIR / "daily note.md"
        with open(file_path, 'a', encoding='utf-8') as f:
            f.write(text + '\n')
        # os.startfile(file_path, "edit")

    def create_or_append_date_note_text(text: str = None):
        """Create or append provided text to date-named note"""
        curdate = datetime.now().strftime("%Y-%m-%d")
        file_path = NOTES_DIR / f"{curdate}.md"
        if text:
            with open(file_path, 'a', encoding='utf-8') as f:
                f.write(text + '\n')
        else:
            if not file_path.exists():
                file_path.touch()
            # edit_file(file_path)


    def add_note_to_physical_therapy(text: str):
        """Add a new note to the top of the physical therapy document"""
        file_path = Path(r"C:\Users\rebec\Dropbox\DropboxDocuments\notes\physical_therapy_daily.md")
        current_date = datetime.now().strftime("%A, %B %d, %Y")
        
        # Read existing content
        if file_path.exists():
            with open(file_path, 'r', encoding='utf-8') as f:
                existing_content = f.read()
        else:
            existing_content = ""
        
        # Prepare new content
        new_content = f"{current_date}\n{text}\n\n{existing_content}"
        
        # Write updated content
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        print(f"Added new note to {file_path}")

    def open_file_custom(path: str):
        """Open a file"""
        if is_mac:
            subprocess.run(["open", path])
        else:  # windows
            os.startfile(path, "open")