# Sound Output Selection Plugin

This plugin allows you to select the sound output device (speaker) using voice commands.

## Voice Commands

- `speaker show`: Shows the speaker selection GUI
- `speaker close`: Hides the speaker selection GUI
- `speaker pick <number>`: Selects the speaker with the given number from the list

## How It Works

The plugin uses Talon's cubeb library to get a list of available output devices. It then displays a GUI that allows you to select one of these devices. When you select a device, it sets it as the active output device by setting the `default_output_device_name` property of the cubeb context.

## Installation

This plugin is part of the Talon Community repository. If you have that installed, you already have this plugin.

## Troubleshooting

If you don't see your output device in the list, make sure it's enabled in your system settings.

If you encounter any issues:
1. Check the Talon log for error messages
2. Make sure your output devices are properly connected and enabled
3. Restart Talon if necessary 