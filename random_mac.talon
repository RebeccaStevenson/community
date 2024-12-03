os: mac
-
(home row | homer): key(cmd-shift-space)  

mat command: 
    user.switcher_focus('matlab')
    key(cmd-0)

mat editor: 
    user.switcher_focus('matlab')
    key(cmd-shift-0)

code edit <user.system_path>:
    user.switcher_focus('terminal')
    sleep(150ms)
    insert("code " + system_path)
    key(enter)
    
cursor edit <user.system_path>:
    user.switcher_focus('terminal')
    sleep(150ms)
    insert("cursor " + system_path)
    key(enter)

install library: insert("C:/Users/rebec/mne-python/1.8.0_0/python.exe -m pip install bycycle")
upgrade library: insert("C:/Users/rebec/mne-python/1.8.0_0/python.exe -m pip install --upgrade bycycle")

activate conda: insert("/Users/rebec/mne-python/1.8.0_0/Scripts/activate")

# System Navigation Commands
tab move: key(ctrl-f7)
keyboard access: key(ctrl-f1)
menu focus: key(ctrl-shift-cmd-m)
window next: key(ctrl-f4)
dock focus: key(ctrl-f3)
toolbar focus: key(ctrl-f5)
float focus: key(ctrl-f6)
status focus: key(ctrl-f8)
show menu: key(ctrl-.)

# Password Manager Commands
password manager: key(shift-cmd-x)
password lock: key(shift-cmd-l)

# Speechify Commands
speech start: key(alt-5)
speech screenshot: key(ctrl-cmd-r)
speech play: key(alt-q)
speech play alt: key(alt-a)
speech save: key(alt-s)

# Dark Mode Commands
dark mode toggle: key(alt-4)
dark mode whitelist: key(shift-cmd-e)

# Add to Library Commands
(add to library | Zotero save): key(shift-cmd-s)
