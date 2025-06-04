#custom vscode commands go here
app: vscode
-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.snippets
tag(): user.splits
tag(): user.tabs
window reload: user.vscode("workbench.action.reloadWindow")
window close: user.vscode("workbench.action.closeWindow")
#multiple_cursor.py support end

please [<user.text>]:
    user.vscode("workbench.action.showCommands")
    insert(user.text or "")

# Sidebar
bar explore: user.vscode("workbench.view.explorer")
bar extensions: user.vscode("workbench.view.extensions")
bar outline: user.vscode("outline.focus")
bar run: user.vscode("workbench.view.debug")
bar search: user.vscode("workbench.view.search")
bar source: user.vscode("workbench.view.scm")
bar test: user.vscode("workbench.view.testing.focus")
bar switch: user.vscode("workbench.action.toggleSidebarVisibility")
bar results: user.vscode("search.action.focusSearchList")

# Symbol search
symbol hunt [<user.text>]:
    user.vscode("workbench.action.gotoSymbol")
    sleep(50ms)
    insert(text or "")

symbol hunt all [<user.text>]:
    user.vscode("workbench.action.showAllSymbols")
    sleep(50ms)
    insert(text or "")

# Panels
panel control: user.vscode("workbench.panel.repl.view.focus")
panel output: user.vscode("workbench.panel.output.focus")
panel problems: user.vscode("workbench.panel.markers.view.focus")
panel switch: user.vscode("workbench.action.togglePanel")
(pan | term) switch: user.vscode("workbench.action.togglePanel")
(panel terminal | term): user.vscode("workbench.action.terminal.focus")
(focus editor | ed): user.vscode("workbench.action.focusActiveEditorGroup")

# Settings
show settings: user.vscode("workbench.action.openGlobalSettings")
show settings json: user.vscode("workbench.action.openSettingsJson")
show settings folder: user.vscode("workbench.action.openFolderSettings")
show settings folder json: user.vscode("workbench.action.openFolderSettingsFile")
show settings workspace: user.vscode("workbench.action.openWorkspaceSettings")
show settings workspace json: user.vscode("workbench.action.openWorkspaceSettingsFile")
show shortcuts: user.vscode("workbench.action.openGlobalKeybindings")
show shortcuts json: user.vscode("workbench.action.openGlobalKeybindingsFile")
show snippets: user.vscode("workbench.action.openSnippets")

# Display
centered switch: user.vscode("workbench.action.toggleCenteredLayout")
fullscreen switch: user.vscode("workbench.action.toggleFullScreen")
theme switch: user.vscode("workbench.action.selectTheme")
wrap switch: user.vscode("editor.action.toggleWordWrap")
zen switch: user.vscode("workbench.action.toggleZenMode")

# File Commands
file hunt [<user.text>]:
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    insert(text or "")
file hunt (pace | paste):
    user.vscode("workbench.action.quickOpen")
    sleep(50ms)
    edit.paste()
file copy name: user.vscode("fileutils.copyFileName")
file copy path: user.vscode("copyFilePath")
file copy local [path]: user.vscode("copyRelativeFilePath")
file create sibling: user.vscode_and_wait("explorer.newFile")
file create: user.vscode("workbench.action.files.newUntitledFile")
file create relative: user.vscode("fileutils.newFile")
file create root: user.vscode("fileutils.newFileAtRoot")
file rename:
    user.vscode("fileutils.renameFile")
    sleep(150ms)
file move:
    user.vscode("fileutils.moveFile")
    sleep(150ms)
file clone:
    user.vscode("fileutils.duplicateFile")
    sleep(150ms)
file delete:
    user.vscode("fileutils.removeFile")
    sleep(150ms)
file open folder: user.vscode("revealFileInOS")
file reveal: user.vscode("workbench.files.action.showActiveFileInExplorer")
save ugly: user.vscode("workbench.action.files.saveWithoutFormatting")

# Language Features
suggest show: user.vscode("editor.action.triggerSuggest")
hint show: user.vscode("editor.action.triggerParameterHints")
definition show: user.vscode("editor.action.revealDefinition")
definition peek: user.vscode("editor.action.peekDefinition")
definition side: user.vscode("editor.action.revealDefinitionAside")
references show: user.vscode("editor.action.goToReferences")
hierarchy peek: user.vscode("editor.showCallHierarchy")
references find: user.vscode("references-view.find")
format that: user.vscode("editor.action.formatDocument")
format selection: user.vscode("editor.action.formatSelection")
imports fix: user.vscode("editor.action.organizeImports")
problem next: user.vscode("editor.action.marker.nextInFiles")
problem last: user.vscode("editor.action.marker.prevInFiles")
problem fix: user.vscode("problems.action.showQuickFixes")
# # rename doesn't work with matlab, change to shortcut for now
# # rename that: user.vscode("editor.action.rename")
# rename that: key(ctrl-shift-l)
refactor that: user.vscode("editor.action.refactor")
whitespace trim: user.vscode("editor.action.trimTrailingWhitespace")
language switch: user.vscode("workbench.action.editor.changeLanguageMode")
#! this might be useful
refactor rename: user.vscode("editor.action.rename")
refactor this: user.vscode("editor.action.refactor")

#code navigation
(go declaration | follow): user.vscode("editor.action.revealDefinition")
go back: user.vscode("workbench.action.navigateBack")
go forward: user.vscode("workbench.action.navigateForward")
go implementation: user.vscode("editor.action.goToImplementation")
go type: user.vscode("editor.action.goToTypeDefinition")
go usage: user.vscode("references-view.find")
go recent [<user.text>]:
    user.vscode("workbench.action.openRecent")
    sleep(50ms)
    insert(text or "")
    sleep(250ms)
go edit: user.vscode("workbench.action.navigateToLastEditLocation")

# Bookmarks. Requires Bookmarks plugin
bar marks: user.vscode("workbench.view.extension.bookmarks")
go marks:
    user.deprecate_command("2023-06-06", "go marks", "bar marks")
    user.vscode("workbench.view.extension.bookmarks")
toggle mark: user.vscode("bookmarks.toggle")
go next mark: user.vscode("bookmarks.jumpToNext")
go last mark: user.vscode("bookmarks.jumpToPrevious")

close other tabs: user.vscode("workbench.action.closeOtherEditors")
close all tabs: user.vscode("workbench.action.closeAllEditors")
close tabs way right: user.vscode("workbench.action.closeEditorsToTheRight")
close tabs way left: user.vscode("workbench.action.closeEditorsToTheLeft")

# Folding
fold that: user.vscode("editor.fold")
unfold that: user.vscode("editor.unfold")
fold those: user.vscode("editor.foldAllMarkerRegions")
unfold those: user.vscode("editor.unfoldRecursively")
fold all: user.vscode("editor.foldAll")
unfold all: user.vscode("editor.unfoldAll")
fold comments: user.vscode("editor.foldAllBlockComments")
fold one: user.vscode("editor.foldLevel1")
fold two: user.vscode("editor.foldLevel2")
fold three: user.vscode("editor.foldLevel3")
fold four: user.vscode("editor.foldLevel4")
fold five: user.vscode("editor.foldLevel5")
fold six: user.vscode("editor.foldLevel6")
fold seven: user.vscode("editor.foldLevel7")

# Git / Github (not using verb-noun-adjective pattern, mirroring terminal commands.)
git branch: user.vscode("git.branchFrom")
git branch this: user.vscode("git.branch")
git checkout [<user.text>]:
    user.vscode("git.checkout")
    sleep(50ms)
    insert(text or "")
git commit [<user.text>]:
    user.vscode("git.commitStaged")
    sleep(100ms)
    user.insert_formatted(text or "", "CAPITALIZE_FIRST_WORD")
git commit undo: user.vscode("git.undoCommit")
git commit amend: user.vscode("git.commitStagedAmend")
git diff: user.vscode("git.openChange")
git fetch: user.vscode("git.fetch")
git fetch all: user.vscode("git.fetchAll")
git ignore: user.vscode("git.ignore")
git merge: user.vscode("git.merge")
git output: user.vscode("git.showOutput")
git pull: user.vscode("git.pullRebase")
git push: user.vscode("git.push")
git push focus: user.vscode("git.pushForce")
git rebase abort: user.vscode("git.rebaseAbort")
git reveal: user.vscode("git.revealInExplorer")
git revert: user.vscode("git.revertChange")
git stash: user.vscode("git.stash")
git stash pop: user.vscode("git.stashPop")
git status: user.vscode("workbench.scm.focus")
git stage: user.vscode("git.stage")
git stage all: user.vscode("git.stageAll")
git sync: user.vscode("git.sync")
git unstage: user.vscode("git.unstage")
git unstage all: user.vscode("git.unstageAll")
pull request: user.vscode("pr.create")
# Use keyboard shortcuts because VSCode relies on when clause contexts to choose the appropriate
# action: https://code.visualstudio.com/api/references/when-clause-contexts
change next: key(alt-f5)
change last: key(shift-alt-f5)

# Testing
test run: user.vscode("testing.runAtCursor")
test run file: user.vscode("testing.runCurrentFile")
test run all: user.vscode("testing.runAll")
test run failed: user.vscode("testing.reRunFailTests")
test run last: user.vscode("testing.reRunLastRun")

test debug: user.vscode("testing.debugAtCursor")
test debug file: user.vscode("testing.debugCurrentFile")
test debug all: user.vscode("testing.debugAll")
test debug failed: user.vscode("testing.debugFailTests")
test debug last: user.vscode("testing.debugLastRun")

test cancel: user.vscode("testing.cancelRun")

# Debugging
break point: user.vscode("editor.debug.action.toggleBreakpoint")
step over: user.vscode("workbench.action.debug.stepOver")
debug step into: user.vscode("workbench.action.debug.stepInto")
debug step out [of]: user.vscode("workbench.action.debug.stepOut")
debug start: user.vscode("workbench.action.debug.start")
debug pause: user.vscode("workbench.action.debug.pause")
debug stopper: user.vscode("workbench.action.debug.stop")
debug continue: user.vscode("workbench.action.debug.continue")
debug restart: user.vscode("workbench.action.debug.restart")
debug console: user.vscode("workbench.action.debug.toggleRepl")
debug clean: user.vscode("workbench.debug.panel.action.clearReplAction")

# Terminal
terminal external: user.vscode("workbench.action.terminal.openNativeConsole")
term new: user.vscode("workbench.action.terminal.new")
term next: user.vscode("workbench.action.terminal.focusNext")
term last: user.vscode("workbench.action.terminal.focusPrevious")
term split: user.vscode("workbench.action.terminal.split")
term zoom: user.vscode("workbench.action.toggleMaximizedPanel")
term trash: user.vscode("workbench.action.terminal.kill")
term toggle: user.vscode_and_wait("workbench.action.terminal.toggleTerminal")
term upper: user.vscode("workbench.action.terminal.scrollUp")
term downer: user.vscode("workbench.action.terminal.scrollDown")
term <number_small>: user.vscode_terminal(number_small)

#TODO: should this be added to linecommands?
copy line down: user.vscode("editor.action.copyLinesDownAction")
copy line up: user.vscode("editor.action.copyLinesUpAction")

select less: user.vscode("editor.action.smartSelect.shrink")
select (more | this): user.vscode("editor.action.smartSelect.expand")

minimap: user.vscode("editor.action.toggleMinimap")
maximize: user.vscode("workbench.action.minimizeOtherEditors")
restore: user.vscode("workbench.action.evenEditorWidths")

#breadcrumb
select breadcrumb: user.vscode("breadcrumbs.focusAndSelect")
# Use `alt-left` and `alt-right` to navigate the bread crumb

replace here:
    user.replace("")
    key(cmd-alt-l)

hover show: user.vscode("editor.action.showHover")

join lines: user.vscode("editor.action.joinLines")

full screen: user.vscode("workbench.action.toggleFullScreen")

curse undo: user.vscode("cursorUndo")

select word: user.vscode("editor.action.addSelectionToNextFindMatch")
skip word: user.vscode("editor.action.moveSelectionToNextFindMatch")

# # jupyter
# cell next: user.vscode("notebook.focusNextEditor")
# cell last: user.vscode("notebook.focusPreviousEditor")
# cell run above: user.vscode("notebook.cell.executeCellsAbove")
# cell run: user.vscode("notebook.cell.execute")

install local: user.vscode("workbench.extensions.action.installVSIX")
preview markdown: user.vscode("markdown.showPreview")


# TODO: make this automatically detect language
# Inserts a TODO comment
todo comment:
    insert("TODO: ")

# Inserts an Important comment
important comment:
    insert("! ")

# Inserts a Question comment
question comment:
    insert("? ")

# Inserts a Temporary comment
temporary comment:
    insert("TEMP: ")

# Inserts an Information comment
info comment:
    insert("* ")

term select: user.vscode("workbench.action.terminal.selectAll")
term clear: user.vscode("workbench.action.terminal.clear")
term max: user.vscode("workbench.action.toggleMaximizedPanel")

disk: user.vscode("workbench.action.files.save")

sidebar: user.vscode("workbench.action.toggleSidebarVisibility")

code markdown preview: user.vscode("markdown.showPreview")
code run notebook cell: user.vscode("notebook.cell.execute")

# R extension shortcuts
stats attach active: user.vscode("r.attachActive")
stats browser open: user.vscode("r.browser.openExternal")
stats browser refresh: user.vscode("r.browser.refresh")
stats build: user.vscode("r.build")
stats build binary: user.vscode("r.buildBinary")
stats check: user.vscode("r.check")
stats create gitignore: user.vscode("r.createGitignore")
stats create lintr config: user.vscode("r.createLintrConfig")
stats create terminal: user.vscode("r.createRTerm")
stats document: user.vscode("r.document")
stats generate cpp: user.vscode("r.generateCCppProperties")
stats next chunk: user.vscode("r.goToNextChunk")
stats previous chunk: user.vscode("r.goToPreviousChunk")
stats head: user.vscode("r.head")
stats help add favorite: user.vscode("r.helpPanel.addToFavorites")
stats help back: user.vscode("r.helpPanel.back")
stats help clear cache: user.vscode("r.helpPanel.clearCache")
stats help filter packages: user.vscode("r.helpPanel.filterPackages")
stats help forward: user.vscode("r.helpPanel.forward")
stats help install packages: user.vscode("r.helpPanel.installPackages")
stats help open external: user.vscode("r.helpPanel.openExternal")
stats help open path: user.vscode("r.helpPanel.openForPath")
stats help open selection: user.vscode("r.helpPanel.openForSelection")
stats help open new panel: user.vscode("r.helpPanel.openInNewPanel")
stats help remove favorite: user.vscode("r.helpPanel.removeFromFavorites")
stats help remove package: user.vscode("r.helpPanel.removePackage")
stats help search package: user.vscode("r.helpPanel.searchPackage")
stats help show all packages: user.vscode("r.helpPanel.showAllPackages")
stats help show favorites: user.vscode("r.helpPanel.showOnlyFavorites")
stats help show quick pick: user.vscode("r.helpPanel.showQuickPick")
stats help summarize topics: user.vscode("r.helpPanel.summarizeTopics")
stats help unsummarize topics: user.vscode("r.helpPanel.unsummarizeTopics")
stats help update packages: user.vscode("r.helpPanel.updateInstalledPackages")
stats help update package: user.vscode("r.helpPanel.updatePackage")
stats install: user.vscode("r.install")
stats knit: user.vscode("r.knitRmd")
stats knit all: user.vscode("r.knitRmdToAll")
stats knit html: user.vscode("r.knitRmdToHtml")
stats knit pdf: user.vscode("r.knitRmdToPdf")
stats launch addin: user.vscode("r.launchAddinPicker")
stats length: user.vscode("r.length")
stats live share retry: user.vscode("r.liveShare.retry")
stats live share toggle: user.vscode("r.liveShare.toggle")
stats load all: user.vscode("r.loadAll")
stats names: user.vscode("r.names")
stats new file: user.vscode("r.newFileDocument")
stats row count: user.vscode("r.nrow")
stats plot close: user.vscode("r.plot.closePlot")
stats plot export: user.vscode("r.plot.exportPlot")
stats plot first: user.vscode("r.plot.firstPlot")
stats plot hide: user.vscode("r.plot.hidePlot")
stats plot last: user.vscode("r.plot.lastPlot")
stats plot next: user.vscode("r.plot.nextPlot")
stats plot open external: user.vscode("r.plot.openExternal")
stats plot open url: user.vscode("r.plot.openUrl")
stats plot previous: user.vscode("r.plot.prevPlot")
stats plot reset: user.vscode("r.plot.resetPlots")
stats plot show viewers: user.vscode("r.plot.showViewers")
stats plot full window: user.vscode("r.plot.toggleFullWindow")
stats plot preview: user.vscode("r.plot.togglePreviewPlots")
stats plot toggle style: user.vscode("r.plot.toggleStyle")
stats plot zoom in: user.vscode("r.plot.zoomIn")
stats plot zoom out: user.vscode("r.plot.zoomOut")
stats preview dataframe: user.vscode("r.previewDataframe")
stats preview environment: user.vscode("r.previewEnvironment")
stats markdown new draft: user.vscode("r.rmarkdown.newDraft")
stats markdown new file: user.vscode("r.rmarkdown.newFileDraft")
stats markdown disable refresh: user.vscode("r.rmarkdown.preview.disableAutoRefresh")
stats markdown enable refresh: user.vscode("r.rmarkdown.preview.enableAutoRefresh")
stats markdown open external: user.vscode("r.rmarkdown.preview.openExternal")
stats markdown refresh: user.vscode("r.rmarkdown.preview.refresh")
stats markdown show source: user.vscode("r.rmarkdown.preview.showSource")
stats markdown toggle style: user.vscode("r.rmarkdown.preview.toggleStyle")
stats markdown set directory: user.vscode("r.rmarkdown.setKnitDirectory")
stats markdown show preview: user.vscode("r.rmarkdown.showPreview")
stats markdown preview side: user.vscode("r.rmarkdown.showPreviewToSide")
stats run above chunks: user.vscode("r.runAboveChunks")
stats run all chunks: user.vscode("r.runAllChunks")
stats run below chunks: user.vscode("r.runBelowChunks")
stats run command: user.vscode("r.runCommand")
stats run command path: user.vscode("r.runCommandWithEditorPath")
stats run command selection: user.vscode("r.runCommandWithSelectionOrWord")
stats run current and below: user.vscode("r.runCurrentAndBelowChunks")
stats run current chunk: user.vscode("r.runCurrentChunk")
stats run current and move: user.vscode("r.runCurrentChunkAndMove")
stats run from beginning: user.vscode("r.runFromBeginningToLine")
stats run to end: user.vscode("r.runFromLineToEnd")
stats run next chunk: user.vscode("r.runNextChunk")
stats run previous chunk: user.vscode("r.runPreviousChunk")
stats run selection: user.vscode("r.runSelection")
stats run selection retain: user.vscode("r.runSelectionRetainCursor")
stats run source: user.vscode("r.runSource")
stats run source echo: user.vscode("r.runSourcewithEcho")
stats select chunk: user.vscode("r.selectCurrentChunk")
stats show help: user.vscode("r.showHelp")
stats test: user.vscode("r.test")
stats head: user.vscode("r.thead")
stats view: user.vscode("r.view")
stats workspace clear: user.vscode("r.workspaceViewer.clear")
stats workspace load: user.vscode("r.workspaceViewer.load")
stats workspace package pick: user.vscode("r.workspaceViewer.package.showQuickPick")
stats workspace refresh: user.vscode("r.workspaceViewer.refreshEntry")
stats workspace remove: user.vscode("r.workspaceViewer.remove")
stats workspace save: user.vscode("r.workspaceViewer.save")
stats workspace view: user.vscode("r.workspaceViewer.view")

# Additional Quarto commands organized by category

# Quarto extension shortcuts keep
assist focus: user.vscode("quarto-assist.focus")
assist pin: user.vscode("quarto.assist.pin")
assist unpin: user.vscode("quarto.assist.unpin")
clear cache: user.vscode("quarto.clearCache")
code view assist: user.vscode("quarto.codeViewAssist")
create project: user.vscode("quarto.createProject")
edit source mode: user.vscode("quarto.editInSourceMode")
edit visual mode: user.vscode("quarto.editInVisualMode")
file create project: user.vscode("quarto.fileCreateProject")
file new document: user.vscode("quarto.fileNewDocument")
cell format: user.vscode("quarto.formatCell")
cell next: user.vscode("quarto.goToNextCell")
cell previous: user.vscode("quarto.goToPreviousCell")
cell insert: user.vscode("quarto.insertCodeCell")
new document: user.vscode("quarto.newDocument")
new notebook: user.vscode("quarto.newNotebook")
new presentation: user.vscode("quarto.newPresentation")
preview: user.vscode("quarto.preview")
preview content: user.vscode("quarto.previewContentShortcut")
preview diagram: user.vscode("quarto.previewDiagram")
preview format: user.vscode("quarto.previewFormat")
preview math: user.vscode("quarto.previewMath")
preview script: user.vscode("quarto.previewScript")
document render: user.vscode("quarto.renderDocument")
project render: user.vscode("quarto.renderProject")
cell run all: user.vscode("quarto.runAllCells")
cell run above: user.vscode("quarto.runCellsAbove")
cell run below: user.vscode("quarto.runCellsBelow")
run current: user.vscode("quarto.runCurrent")
cell run advance: user.vscode("quarto.runCurrentAdvance")
cell run: user.vscode("quarto.runCurrentCell")
cell run next: user.vscode("quarto.runNextCell")
cell run previous: user.vscode("quarto.runPreviousCell")
run selection: user.vscode("quarto.runSelection")
show assist: user.vscode("quarto.showAssist")
toggle bold: user.vscode("quarto.toggleBold")
toggle code: user.vscode("quarto.toggleCode")
toggle italic: user.vscode("quarto.toggleItalic")
verify installation: user.vscode("quarto.verifyInstallation")
walkthrough new document: user.vscode("quarto.walkthrough.newDocument")
walkthrough preview: user.vscode("quarto.walkthrough.preview")
zotero configure library: user.vscode("quarto.zoteroConfigureLibrary")
zotero sync web library: user.vscode("quarto.zoteroSyncWebLibrary")
zotero unauthorized: user.vscode("quarto.zoteroUnauthorized")