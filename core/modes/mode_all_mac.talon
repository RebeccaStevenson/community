mode: all
os: mac
-
^(whisper | wispr) start: 
    speech.disable()
    key(alt-.)
^(whisper | wispr) stop: 
    key(alt-.)
    speech.enable()
^(whisper | wispr | test) stop: 
    key(alt-.)
    speech.enable()
^super start: 
    speech.disable()
    key(alt-cmd-r)
^super stop: 
    key(alt-cmd-r)
    speech.enable()
^super mode: 
    key(alt-cmd-u)
^super cancel: 
    speech.enable()
    key(esc)

^super custom: 
    key(alt-cmd-u)
    sleep(100ms)
    key(cmd-1)
    sleep(100ms)
    key(enter)
    sleep(200ms)
    key(esc)

^super default: 
    key(alt-cmd-u)
    sleep(100ms)
    key(cmd-2)
    sleep(100ms)
    key(enter)
    sleep(200ms)
    key(esc)

^super notes: 
    key(alt-cmd-u)
    sleep(100ms)
    key(cmd-3)
    sleep(100ms)
    key(enter)
    sleep(200ms)
    key(esc)