import os
import subprocess

from talon import Context, Module, app

# path to community/knausj root directory
REPO_DIR = os.path.dirname(os.path.dirname(__file__))
SETTINGS_DIR = os.path.join(REPO_DIR, "settings")

mod = Module()
ctx = Context()

@mod.action_class
class ModuleActions:
    def edit_file(path: str):
        """Tries to open a file in the user's preferred text editor."""


winctx, linuxctx, macctx = Context(), Context(), Context()
winctx.matches = "os: windows"
linuxctx.matches = "os: linux"
macctx.matches = "os: mac"


@winctx.action_class("self")
class WinActions:
    def edit_file(path):
        # If there's no applications registered that can open the given type
        # of file, 'edit' will fail, but 'open' always gives the user a
        # choice between applications.
        try:

            # Change to open with VSCode
            subprocess.run(["code", path], check=True)

            # os.startfile(path, "edit")
        except OSError:
            os.startfile(path, "open")


@macctx.action_class("self")
class MacActions:
    def edit_text_file(path):
        # -t means try to open in a text editor.
        open_with_subprocess(path, ["/usr/bin/open", "-t", path])


@linuxctx.action_class("self")
class LinuxActions:
    def edit_text_file(path):
        # we use xdg-open for this even though it might not open a text
        # editor. we could use $EDITOR, but that might be something that
        # requires a terminal (eg nano, vi).
        open_with_subprocess(path, ["/usr/bin/xdg-open", path])

