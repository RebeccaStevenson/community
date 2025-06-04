from talon import Module, actions

mod = Module()

@mod.action_class
class Actions:
    def superwhisper_normal_mode():
        """Switches Superwhisper to normal mode"""

        actions.user.system_command_nb("/bin/bash /Users/rebec/scripts/superwhisper_normal_mode.sh")

    def superwhisper_local_mode():
        """Switches Superwhisper to local mode"""
        
        actions.user.system_command_nb("/bin/bash /Users/rebec/scripts/superwhisper_local_mode.sh") 
        
