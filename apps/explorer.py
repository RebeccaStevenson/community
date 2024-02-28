lfrom talon import Module, actions

mod = Module()

@mod.action_class
class Actions:
    def run_command(command: str, argument: str):
        """
        Run a system command with an argument
        """
        actions.key("win-r")
        actions.sleep("500ms")
        actions.insert(f"{command} {argument}")
        actions.key("enter")
