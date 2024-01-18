mode: all
speech.engine: wav2letter
-
^talon sleep [<phrase>]$: speech.disable()
^wake up [<phrase>]$: speech.disable()
^(talon wake)+$: speech.enable()
go to sleep: skip()