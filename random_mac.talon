win last: key(cmd-tab)
switch apps: key(cmd-tab)

mat run: 
    key(cmd-s)
    user.switcher_focus('matlab')
    key(cmd-shift-0)
    key(f5)
    key(cmd-0)
    #//TODO: run and debug mode, run line in matlab

mat command: 
    user.switcher_focus('matlab')
    key(cmd-0)

mat editor: 
    user.switcher_focus('matlab')
    key(cmd-shift-0)

code edit <user.system_path>:
    key(cmd-r)
    sleep(150ms)
    insert("code " + system_path)
    key(enter)
cursor edit <user.system_path>:
    key(cmd-r)
    sleep(150ms)
    insert("cursor " + system_path)
    key(enter)
(direct | edit) <user.system_path>:
    user.open_file_custom(system_path)
folder <user.system_path>:
    insert(system_path)
<user.system_path> edit:
    user.open_file_custom(system_path)
    # user.switcher_focus('Cursor')

insert date: user.insert_current_date()
insert date long: user.insert_current_date("%A, %B %d, %Y")
lower: key(down:12)
hire: key(up:12)

prompt debug: insert("Below you will find a script followed by the output from running the script. Could you please help me debug the following error:")
dough: edit.line_insert_down()
bow: edit.line_insert_up()

terminal Settings: insert("Import-Module PSReadLine")
import module: insert("Import-Module PSReadLine")

add daily note <user.text>:
    user.add_daily_note(text)

add note <user.text>:
    user.append_to_daily_note_text(text)

[create] daily note <user.text>:
    user.create_or_append_date_note_text(text)

therapy note <user.text>:
    user.add_note_to_physical_therapy(text)

install library: insert("C:/Users/rebec/mne-python/1.8.0_0/python.exe -m pip install bycycle")
upgrade library: insert("C:/Users/rebec/mne-python/1.8.0_0/python.exe -m pip install --upgrade bycycle")

activate conda: insert("C:/Users/rebec/mne-python/1.8.0_0/Scripts/activate")
