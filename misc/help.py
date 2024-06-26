from typing import List

from talon import Module, Context, registry, clip, ui, actions, app



module = Module()
context = Context()


def _print_and_copy_lines(lines: List):
    string = "\n".join(map(str, lines))
    print(string)
    clip.set_text(string)
    print("String copied to clipboard.")
    app.notify(string)


@module.action_class
class Actions:
    def print_copy_actions() -> None:
        """Print & copy all declared actions."""
        _print_and_copy_lines(registry.decls.actions.values())

    def print_copy_captures() -> None:
        """Print & copy all declared captures."""
        # TODO: Switch this back to values once the upstream issue is fixed in Talon
        _print_and_copy_lines(registry.decls.captures.keys())

    def print_copy_settings() -> None:
        """Print & copy all declared settings."""
        _print_and_copy_lines(registry.decls.settings.values())

    def copy_current_app_info() -> None:
        """Copy all info for the current app."""
        active_app = ui.active_app()
        info = [
            'Name:   "{}"'.format(active_app.name),
            'Exe:    "{}"'.format(active_app.exe),
            'Title:  "{}"'.format(ui.active_window().title),
            'Bundle: "{}"'.format(active_app.bundle),
        ]
        _print_and_copy_lines(info)
