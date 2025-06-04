from talon import Module, actions, app, imgui
from talon.lib import cubeb

ctx = cubeb.Context()
mod = Module()

# Define the sound module and the set_output_device action
mod.list("sound_output", desc="List of available sound output devices")
mod.tag("sound_output_selection", desc="Tag for enabling sound output selection commands")

@mod.action_class
class Actions:
    def speaker_selection_toggle():
        """Show GUI for choosing the output speaker"""
        if gui.showing:
            gui.hide()
        else:
            update_speaker_list()
            gui.show()

    def speaker_selection_hide():
        """Hide the speaker selection GUI"""
        gui.hide()

    def speaker_select(index: int):
        """Selects a speaker"""
        if 1 <= index and index <= len(speaker_device_list):
            device_name = speaker_device_list[index - 1]
            # Handle "System Default" specially
            if device_name == "System Default":
                device_name = None
            
            # Set the output device directly using the cubeb context
            ctx.default_output_device_name = device_name
            app.notify(f"Activating speaker: {speaker_device_list[index - 1]}")
            gui.hide()

speaker_device_list = []

def update_speaker_list():
    global speaker_device_list
    speaker_device_list = ["System Default"]
    
    # Get all enabled output devices
    devices = [
        dev.name for dev in ctx.outputs() if dev.state == cubeb.DeviceState.ENABLED
    ]
    
    devices.sort()
    speaker_device_list += devices


def devices_changed(device_type):
    update_speaker_list()


@imgui.open()
def gui(gui: imgui.GUI):
    gui.text("Select a Speaker")
    gui.line()
    for index, item in enumerate(speaker_device_list, 1):
        if gui.button(f"{index}. {item}"):
            actions.user.speaker_select(index)

    gui.spacer()
    if gui.button("Speaker close"):
        actions.user.speaker_selection_hide()


def on_ready():
    ctx.register("devices_changed", devices_changed)
    update_speaker_list()


app.register("ready", on_ready) 