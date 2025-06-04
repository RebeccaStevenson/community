mode: all
os: mac
-
(whisper) start: 
    speech.disable()
    key(alt-cmd-r)
(whisper) stop: 
    key(alt-cmd-r)
    speech.enable()
(super | whisper) mode: 
    key(alt-cmd-u)
(super | whisper) cancel: 
    speech.enable()
    key(esc)

whisper local: user.superwhisper_local_mode() 
whisper normal: user.superwhisper_normal_mode() 
