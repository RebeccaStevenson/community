app: cursor
-
# Chat Commands
(chat | compose): key(cmd-l)
chat agent new open: user.vscode("composer.newAgentChat")
chat cancel: user.vscode("composer.cancelComposerStep")
chat stop: key(shift-cmd-backspace)
chat reject: key(shift-cmd-backspace)
chat editor: user.vscode("composer.openChatAsEditor")
chat panel: key(shift-alt-cmd-r)
chat error: user.vscode("composer.fixerrormessage")
chat followup focus: key(cmd-y)
chat new: user.vscode("composer.createNewWithPrevContext")
chat pane: key(cmd-shift-d)
chat context: key(cmd-shift-g)
chat mode: key(cmd-.)
mode switch: key(cmd-.)
model switch: key(alt-cmd-/)
chat next: key(alt-l)
review next: key(alt-l)
# Tab Management
# tab close: user.vscode("composer.closeComposerTab")
# tab new: user.vscode("composer.createNewComposerTab")
# tab next: user.vscode("composer.nextChatTab")
# tab previous: user.vscode("composer.previousChatTab")

# Inline Editing Commands
ask: key(alt-enter)
cancel inline: key(escape)

# Model switching with list
model switch {user.cursor_model}:
    key(alt-cmd-/)
    sleep(150ms)
    insert(cursor_model)
    sleep(150ms)
    key(enter)
