os: win
-
win last: key(alt-tab)
switch apps: key(super-tab)

mat run: 
    key(ctrl-s)
    user.switcher_focus('matlab')
    key(ctrl-shift-0)
    key(f5)
    key(ctrl-0)
    #//TODO: run and debug mode, run line in matlab

mat command: 
    user.switcher_focus('matlab')
    key(ctrl-0)

mat editor: 
    user.switcher_focus('matlab')
    key(ctrl-shift-0)

code edit <user.system_path>:
    key(super-r)
    sleep(150ms)
    insert("code " + system_path)
    key(enter)
cursor edit <user.system_path>:
    key(super-r)
    sleep(150ms)
    insert("cursor " + system_path)
    key(enter)

install library: insert("C:/Users/rebec/mne-python/1.8.0_0/python.exe -m pip install bycycle")
upgrade library: insert("C:/Users/rebec/mne-python/1.8.0_0/python.exe -m pip install --upgrade bycycle")

activate conda: insert("C:/Users/rebec/mne-python/1.8.0_0/Scripts/activate")
