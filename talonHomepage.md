Talon
Powerful hands-free input replacement.

Table of Contents
Introduction
Overview
Getting Started
Getting Scripts
Learning Talon
.talon Files
Overview
API Reference
talon
talon.app
register()
unregister()
notify()
talon.clip
has_mode()
text()
set_text()
image()
set_image()
clear()
NoChange
revert()
capture()
talon.fs
FsEventFlags
watch()
unwatch()
talon.noise
register()
unregister()
Introduction
Overview
Talon aims to bring programming, realtime video gaming, command line, and full desktop computer proficiency to people who have limited or no use of their hands, and vastly improve productivity and wow-factor of anyone who can use a computer.

Join the Slack to talk, get hyped, or for help with Talon.
NOTE: This Talon release is very new and is not fully documented yet! Please ask any questions in the #help channel on the Slack linked above.

System requirements:
macOS High Sierra (10.13) or newer. Talon is a universal2 build with native Apple Silicon support.

Linux / X11 (Ubuntu 18.04+, and most modern distros), Wayland support is currently limited to XWayland

Windows 8 or newer# Talon

Powerful hands-free input replacement.

## Table of Contents

- [Introduction](#introduction)
- [Overview](#overview)
- [Getting Started](#getting-started)
- [Getting Scripts](#getting-scripts)
- [Learning Talon](#learning-talon)
- [.talon Files](#talon-files)
  - [Overview](#overview-1)
- [API Reference](#api-reference)
  - [talon](#talon)
  - [talon.app](#talonapp)
    - [register()](#register)
    - [unregister()](#unregister)
    - [notify()](#notify)
  - [talon.clip](#talonclip)
    - [has_mode()](#has_mode)
    - [text()](#text)
    - [set_text()](#set_text)
    - [image()](#image)
    - [set_image()](#set_image)
    - [clear()](#clear)
    - [NoChange](#nochange)
    - [revert()](#revert)
    - [capture()](#capture)
  - [talon.fs](#talonfs)
    - [FsEventFlags](#fseventflags)
    - [watch()](#watch)
    - [unwatch()](#unwatch)
  - [talon.noise](#talonnoise)
    - [register()](#register-1)
    - [unregister()](#unregister-1)

## Introduction

### Overview

Talon aims to bring programming, realtime video gaming, command line, and full desktop computer proficiency to people who have limited or no use of their hands, and vastly improve productivity and wow-factor of anyone who can use a computer.

Join the Slack to talk, get hyped, or for help with Talon.
NOTE: This Talon release is very new and is not fully documented yet! Please ask any questions in the #help channel on the Slack linked above.

System requirements:
- macOS High Sierra (10.13) or newer. Talon is a universal2 build with native Apple Silicon support.
- Linux / X11 (Ubuntu 18.04+, and most modern distros), Wayland support is currently limited to XWayland
- Windows 8 or newer

Powerful voice control - Talon comes with a free speech recognition engine, and it is also compatible with Dragon with no additional setup.

Multiple algorithms for eye tracking mouse control (depends on a single Tobii 4C, Tobii 5 or equivalent eye tracker)

Noise recognition system (pop and hiss). Many more noises coming soon.

Scriptable with Python 3 (via embedded CPython, no need to install or configure Python on your host system).

Talon is very modular and adaptable - you can use eye tracking without speech recognition, or vice versa.

## Getting Started

1. Download and install Talon for your operating system.
2. Run the Talon app.
3. Open the Talon Home directory. This is `%APPDATA%\Talon` on Windows, and `~/.talon` on macOS/Linux. (Talon has a menu in your system tray near the clock, you can use Scripting -> Open `~/.talon` as a shortcut open Talon Home).
4. Add some scripts to `~/.talon/user` to add voice commands and other behaviour to Talon (see the Getting Scripts section below). Your user scripts control all of the voice commands in Talon, so Talon won’t recognize any commands until you add some scripts.
5. Install Conformer using Talon’s Speech Recognition menu. 
6. Go to Scripting -> View Log in the menu for debug output, or Scripting -> Open REPL for a Python command line.

## Getting Scripts

The best way to get started right now is to clone `talonhub/community` into your `~/.talon/user` directory. Ask in #help on Slack if you run into any problems.

## Learning Talon

These are some resources to help you learn to use and customize Talon:

- Talon Practice (by chaosparrot)
- talonhub/community README
- Unofficial Community Wiki
- Search User Repositories

## .talon Files

### Overview

Voice commands are defined in files with the `.talon` file extension, located in the user directory inside Talon Home.

`.talon` files can:
- match specific applications, window titles, or other criteria
- define voice commands
- define global hotkeys
- reimplement global actions (for example, to change the behavior of Talon in a specific application)
- set settings
- enable tags

Creating a file in user named `hello.talon` with these contents will declare a voice command:

```
hello talon: "hello world"
```

This means when you say `hello talon`, Talon will type `hello world`.

This is a more advanced example:

```
# activate this .talon file if the current app name is "Chrome"
# you can find app names by running ui.apps() in the REPL
app.name: Chrome
-
# key_wait increases the delay when pressing keys (milliseconds)
# this is useful if an app seems to jumble or drop keys
settings():
    key_wait = 4.0

# activate the global tag "browser"
tag(): browser

# define some voice commands
hello chrome: "hello world"
switch tab: key(ctrl-tab)
go to google:
    # note: use key(cmd-t) on Mac
    key(ctrl-t)
    insert("google.com")
    key(enter)
```

The `-` on the line after after `app.name` is important.

Lines above the `-` are used to set criteria for activating the file.

Lines below the `-` declare things or activate tags.

Any line beginning with `#` is considered to be a comment and ignored.

## API Reference

### talon

class `talon.Context(name: str = None, *, desc: str = None)`

Creating a Context:

```python
from talon import Context
ctx = Context()
action_class(path: str) → Callable[[Class], ActionClassProxy]
@ctx.action_class('prefix')
class Actions:
    def action_name():
        print("Running actions.prefix.action_name()")
action(path: str)
@ctx.action('prefix.action_name')
def action_name():
    print("Running actions.prefix.action_name()")
capture(path: str = None, *, rule: str = None) → Callable[[DecoratedT], DecoratedT]
@ctx.capture('number', rule='(one | two)')
def number(m) -> int:
    return 1 if m[0] == 'one' else 2
dynamic_list(path: str) → Callable[[DecoratedT], DecoratedT]
@ctx.dynamic_list('prefix.list_name')
def list_name() -> Union[str, list[str], dict[str, str]]:
    return ['word', 'word']
property matches: str
Describe when to activate this Context. If not specified, Context is always active.

ctx.matches = r"""
os: windows
app.name: Slack
"""
Type:
str

property apps
apps:

ctx.apps["chrome"] = r"""
os: windows
app.name: Google Chrome
"""
Type:
str

property selections: dict[str, str]
selections:

ctx.selections["user.listname"] = """
some text to use for a subset selection
"""
Type:
dict[str, str]

property lists: dict[str, Mapping[str, str]]
lists:

ctx.lists["user.listname"] = ["word", "word2"]
ctx.lists["user.listname"] = {
    "pronunciation": "word",
}
Type:
dict[str, Union[list[str], dict[str, str]]]

property settings
settings:

ctx.settings = {
    "input_wait": 1.0,
}
Type:
dict[str, Any]

property tags
tags:

ctx.tags = ["user.terminal"]
Type:
frozenset[str]

property commands: Mapping[str, CommandImpl]
Return the commands defined by this Context

Type:
dict[str, CommandImpl]

property hotkeys: Mapping[str, ScriptImpl]
Return the hotkeys defined by this Context

Type:
dict[str, ScriptImpl]

class `talon.Module(name: str = None, *, desc: str = None)`

Creating a Module:

```python
from talon import Module
mod = Module()
action_class(cls: Class) → ActionClassProxy
@mod.action_class
class Actions:
    def action_name():
        "Description of the action"

    def second_action(arg1: int, arg2: str='') -> str:
        "Action with arguments, return type, and body"
        return 'test'
action(func: DecoratedT) → ActionDecl[DecoratedT]
@mod.action
def action_name():
    "Description of the action"
capture(*, rule: str) → Callable[[DecoratedT], DecoratedT]
capture(func: DecoratedT) → DecoratedT
@mod.capture
def capture_name() -> str:
    "Description of the capture"
scope(func: ScopeFunc) → ScopeDecl
@mod.scope
def scope():
    return {
        "key": "value",
    }

# call scope.update() at any time to force a scope update
setting(name: str, type: ~typing.Type[~talon.scripting.types.T], default: ~talon.scripting.types.T | ~talon.scripting.types.SettingDecl.NoValueType = <talon.scripting.types.SettingDecl.NoValueType object>, desc: str = None) → SettingDecl

Powerful voice control - Talon comes with a free speech recognition engine, and it is also compatible with Dragon with no additional setup.

Multiple algorithms for eye tracking mouse control (depends on a single Tobii 4C, Tobii 5 or equivalent eye tracker)

Noise recognition system (pop and hiss). Many more noises coming soon.

Scriptable with Python 3 (via embedded CPython, no need to install or configure Python on your host system).

Talon is very modular and adaptable - you can use eye tracking without speech recognition, or vice versa.

Getting Started
Download and install Talon for your operating system.
Run the Talon app.

Open the Talon Home directory. This is %APPDATA%\Talon on Windows, and ~/.talon on macOS/Linux. (Talon has a menu in your system tray near the clock, you can use Scripting -> Open ~/.talon as a shortcut open Talon Home).

Add some scripts to ~/.talon/user to add voice commands and other behaviour to Talon (see the Getting Scripts section below). Your user scripts control all of the voice commands in Talon, so Talon won’t recognize any commands until you add some scripts.
Install Conformer using Talon’s Speech Recognition menu.

Go to Scripting -> View Log in the menu for debug output, or Scripting -> Open REPL for a Python command line.

Getting Scripts
The best way to get started right now is to clone talonhub/community into your ~/.talon/user directory. Ask in #help on Slack if you run into any problems.
Learning Talon
These are some resources to help you learn to use and customize Talon:

Talon Practice (by chaosparrot)
talonhub/community README
Unofficial Community Wiki
Search User Repositories
.talon Files
Overview
Voice commands are defined in files with the .talon file extension, located in the user directory inside Talon Home.
.talon files can:

match specific applications, window titles, or other criteria

define voice commands

define global hotkeys

reimplement global actions (for example, to change the behavior of Talon in a specific application)

set settings

enable tags

Creating a file in user named hello.talon with these contents will declare a voice command:

hello talon: "hello world"
This means when you say hello talon, Talon will type hello world.

This is a more advanced example:

# activate this .talon file if the current app name is "Chrome"
# you can find app names by running ui.apps() in the REPL
app.name: Chrome
-
# key_wait increases the delay when pressing keys (milliseconds)
# this is useful if an app seems to jumble or drop keys
settings():
    key_wait = 4.0

# activate the global tag "browser"
tag(): browser

# define some voice commands
hello chrome: "hello world"
switch tab: key(ctrl-tab)
go to google:
    # note: use key(cmd-t) on Mac
    key(ctrl-t)
    insert("google.com")
    key(enter)
The - on the line after after app.name is important.

Lines above the - are used to set criteria for activating the file.

Lines below the - declare things or activate tags.

Any line beginning with # is considered to be a comment and ignored.

API Reference
talon
class talon.Context(name: str = None, *, desc: str = None)
Creating a Context:

from talon import Context
ctx = Context()
action_class(path: str) → Callable[[Class], ActionClassProxy]
@ctx.action_class('prefix')
class Actions:
    def action_name():
        print("Running actions.prefix.action_name()")
action(path: str)
@ctx.action('prefix.action_name')
def action_name():
    print("Running actions.prefix.action_name()")
capture(path: str = None, *, rule: str = None) → Callable[[DecoratedT], DecoratedT]
@ctx.capture('number', rule='(one | two)')
def number(m) -> int:
    return 1 if m[0] == 'one' else 2
dynamic_list(path: str) → Callable[[DecoratedT], DecoratedT]
@ctx.dynamic_list('prefix.list_name')
def list_name() -> Union[str, list[str], dict[str, str]]:
    return ['word', 'word']
property matches: str
Describe when to activate this Context. If not specified, Context is always active.

ctx.matches = r"""
os: windows
app.name: Slack
"""
Type:
str

property apps
apps:

ctx.apps["chrome"] = r"""
os: windows
app.name: Google Chrome
"""
Type:
str

property selections: dict[str, str]
selections:

ctx.selections["user.listname"] = """
some text to use for a subset selection
"""
Type:
dict[str, str]

property lists: dict[str, Mapping[str, str]]
lists:

ctx.lists["user.listname"] = ["word", "word2"]
ctx.lists["user.listname"] = {
    "pronunciation": "word",
}
Type:
dict[str, Union[list[str], dict[str, str]]]

property settings
settings:

ctx.settings = {
    "input_wait": 1.0,
}
Type:
dict[str, Any]

property tags
tags:

ctx.tags = ["user.terminal"]
Type:
frozenset[str]

property commands: Mapping[str, CommandImpl]
Return the commands defined by this Context

Type:
dict[str, CommandImpl]

property hotkeys: Mapping[str, ScriptImpl]
Return the hotkeys defined by this Context

Type:
dict[str, ScriptImpl]

class talon.Module(name: str = None, *, desc: str = None)
Creating a Module:

from talon import Module
mod = Module()
action_class(cls: Class) → ActionClassProxy
@mod.action_class
class Actions:
    def action_name():
        "Description of the action"

    def second_action(arg1: int, arg2: str='') -> str:
        "Action with arguments, return type, and body"
        return 'test'
action(func: DecoratedT) → ActionDecl[DecoratedT]
@mod.action
def action_name():
    "Description of the action"
capture(*, rule: str) → Callable[[DecoratedT], DecoratedT]
capture(func: DecoratedT) → DecoratedT
@mod.capture
def capture_name() -> str:
    "Description of the capture"
scope(func: ScopeFunc) → ScopeDecl
@mod.scope
def scope():
    return {
        "key": "value",
    }

# call scope.update() at any time to force a scope update
setting(name: str, type: ~typing.Type[~talon.scripting.types.T], default: ~talon.scripting.types.T | ~talon.scripting.types.SettingDecl.NoValueType = <talon.scripting.types.SettingDecl.NoValueType object>, desc: str = None) → SettingDecl[T]
mod.setting("setting_name", int, default=0, desc="an example integer setting")
mod.setting("setting_name_2", str, default='', desc="an example string setting")
list(name: str, desc: str = None) → NameDecl
mod.list("list_name", desc="list description")
mode(name: str, desc: str = None) → NameDecl
mod.mode("mode_name", desc="mode description")
tag(name: str, desc: str = None) → NameDecl
mod.tag("tag_name", desc="tag description")
talon.actions
…

talon.registry
…

talon.scope
…

talon.settings
…

talon.storage
…

talon.app
talon.app.register(topic: str, cb: Callable) → None
Register for an application event.

ready: Talon is ready. Your callback will be called after Talon launch and during script reloads.

launch: Talon launched. Your callback will only be called immediately after Talon launch.

startup: Talon launched during system startup.

from talon import app

def app_ready():
    print("Talon is ready")
app.register("ready", app_ready)
talon.app.unregister(topic: Any, cb: Callable) → None
Unregister a previously registered event:

app.unregister("ready", app_ready)
talon.app.notify(title: str = None, subtitle: str = None, body: str = None, sound: bool = False) → None
Display a desktop notification, optionally playing a sound.

from talon import app

app.notify(body="Hello world")
app.notify(title="Hello world",
           subtitle="Welcome to Talon",
           body="Enjoy your stay.",
           sound=True)
talon.clip
talon.clip.has_mode(mode: str) → bool
Check if a clipboard mode is supported.

Useful modes: “main”, “select”, “find”

talon.clip.text(*, mode: str = None) → str | None
Get the text contents of the clipboard.

talon.clip.set_text(s: str, *, mode: str = None) → None
Set the text contents of the clipboard.

talon.clip.image(*, mode: str = None) → Image | None
Get the image contents of the clipboard.

talon.clip.set_image(image: Image, *, mode: str = None) → None
Set the image contents of the clipboard.

talon.clip.clear(*, mode: str = None) → None
Clear the clipboard.

exception talon.clip.NoChange
talon.clip.revert(*, old: PyMimeData = None, mode: str = None) → Generator[None, None, None]
Restore the old contents of the clipboard after running a block:

from talon import clip

with clip.revert():
    clip.set_text("this will only be set temporarily")
talon.clip.capture(timeout: float = 0.5, *, inc: int = 0, mode: str = None, formats: list[str] = None) → Generator[ChangePromise, None, None]
Capture a change in the clipboard, then restore the old text contents:

from talon import actions, clip

with clip.capture() as s:
    actions.edit.copy()
print(s.get())
talon.fs
from talon import fs

def on_change(path, flags):
    if flags.renamed:
        print("renamed", path)
    if flags.exists:
        print("changed", path)
    else:
        print("deleted", path)

fs.watch('/path/to/stuff', on_change)
class talon.fs.FsEventFlags(exists: bool, renamed: bool, stat: os.stat_result | None)
talon.fs.watch(path: str, cb: Callable[[str, FsEventFlags], None]) → None
Watch path for changes and call cb(path: str, flags: FsEventFlags) when changes occur.

talon.fs.unwatch(path: str, cb: Callable[[str, FsEventFlags], None]) → None
Remove cb from the set of callbacks being watched for path.

talon.noise
talon.noise.register(topic: Any, cb: Callable) → None
Register for a noise event.

"" - an empty string registers the callback for all noises.
# Talon

Powerful hands-free input replacement.

## Table of Contents

- [Introduction](#introduction)
- [Overview](#overview)
- [Getting Started](#getting-started)
- [Getting Scripts](#getting-scripts)
- [Learning Talon](#learning-talon)
- [.talon Files](#talon-files)
  - [Overview](#overview-1)
- [API Reference](#api-reference)
  - [talon](#talon)
  - [talon.app](#talonapp)
    - [register()](#register)
    - [unregister()](#unregister)
    - [notify()](#notify)
  - [talon.clip](#talonclip)
    - [has_mode()](#has_mode)
    - [text()](#text)
    - [set_text()](#set_text)
    - [image()](#image)
    - [set_image()](#set_image)
    - [clear()](#clear)
    - [NoChange](#nochange)
    - [revert()](#revert)
    - [capture()](#capture)
  - [talon.fs](#talonfs)
    - [FsEventFlags](#fseventflags)
    - [watch()](#watch)
    - [unwatch()](#unwatch)
  - [talon.noise](#talonnoise)
    - [register()](#register-1)
    - [unregister()](#unregister-1)

## Introduction

### Overview

Talon aims to bring programming, realtime video gaming, command line, and full desktop computer proficiency to people who have limited or no use of their hands, and vastly improve productivity and wow-factor of anyone who can use a computer.

Join the Slack to talk, get hyped, or for help with Talon.
NOTE: This Talon release is very new and is not fully documented yet! Please ask any questions in the #help channel on the Slack linked above.

System requirements:
- macOS High Sierra (10.13) or newer. Talon is a universal2 build with native Apple Silicon support.
- Linux / X11 (Ubuntu 18.04+, and most modern distros), Wayland support is currently limited to XWayland
- Windows 8 or newer

Powerful voice control - Talon comes with a free speech recognition engine, and it is also compatible with Dragon with no additional setup.

Multiple algorithms for eye tracking mouse control (depends on a single Tobii 4C, Tobii 5 or equivalent eye tracker)

Noise recognition system (pop and hiss). Many more noises coming soon.

Scriptable with Python 3 (via embedded CPython, no need to install or configure Python on your host system).

Talon is very modular and adaptable - you can use eye tracking without speech recognition, or vice versa.

## Getting Started

1. Download and install Talon for your operating system.
2. Run the Talon app.
3. Open the Talon Home directory. This is `%APPDATA%\Talon` on Windows, and `~/.talon` on macOS/Linux. (Talon has a menu in your system tray near the clock, you can use Scripting -> Open `~/.talon` as a shortcut open Talon Home).
4. Add some scripts to `~/.talon/user` to add voice commands and other behaviour to Talon (see the Getting Scripts section below). Your user scripts control all of the voice commands in Talon, so Talon won’t recognize any commands until you add some scripts.
5. Install Conformer using Talon’s Speech Recognition menu.
6. Go to Scripting -> View Log in the menu for debug output, or Scripting -> Open REPL for a Python command line.

## Getting Scripts

The best way to get started right now is to clone `talonhub/community` into your `~/.talon/user` directory. Ask in #help on Slack if you run into any problems.

## Learning Talon

These are some resources to help you learn to use and customize Talon:

- Talon Practice (by chaosparrot)
- talonhub/community README
- Unofficial Community Wiki
- Search User Repositories

## .talon Files

### Overview

Voice commands are defined in files with the `.talon` file extension, located in the user directory inside Talon Home.

`.talon` files can:
- match specific applications, window titles, or other criteria
- define voice commands
- define global hotkeys
- reimplement global actions (for example, to change the behavior of Talon in a specific application)
- set settings
- enable tags

Creating a file in user named `hello.talon` with these contents will declare a voice command:

```
hello talon: "hello world"
```

This means when you say `hello talon`, Talon will type `hello world`.

This is a more advanced example:

```
# activate this .talon file if the current app name is "Chrome"
# you can find app names by running ui.apps() in the REPL
app.name: Chrome
-
# key_wait increases the delay when pressing keys (milliseconds)
# this is useful if an app seems to jumble or drop keys
settings():
    key_wait = 4.0

# activate the global tag "browser"
tag(): browser

# define some voice commands
hello chrome: "hello world"
switch tab: key(ctrl-tab)
go to google:
    # note: use key(cmd-t) on Mac
    key(ctrl-t)
    insert("google.com")
    key(enter)
```

The `-` on the line after after `app.name` is important.

Lines above the `-` are used to set criteria for activating the file.

Lines below the `-` declare things or activate tags.

Any line beginning with `#` is considered to be a comment and ignored.

## API Reference

### talon

class `talon.Context(name: str = None, *, desc: str = None)`

Creating a Context:

```python
from talon import Context
ctx = Context()
action_class(path: str) → Callable[[Class], ActionClassProxy]
@ctx.action_class('prefix')
class Actions:
    def action_name():
        print("Running actions.prefix.action_name()")
action(path: str)
@ctx.action('prefix.action_name')
def action_name():
    print("Running actions.prefix.action_name()")
capture(path: str = None, *, rule: str = None) → Callable[[DecoratedT], DecoratedT]
@ctx.capture('number', rule='(one | two)')
def number(m) -> int:
    return 1 if m[0] == 'one' else 2
dynamic_list(path: str) → Callable[[DecoratedT], DecoratedT]
@ctx.dynamic_list('prefix.list_name')
def list_name() -> Union[str, list[str], dict[str, str]]:
    return ['word', 'word']
property matches: str
Describe when to activate this Context. If not specified, Context is always active.

ctx.matches = r"""
os: windows
app.name: Slack
"""
Type:
str

property apps
apps:

ctx.apps["chrome"] = r"""
os: windows
app.name: Google Chrome
"""
Type:
str

property selections: dict[str, str]
selections:

ctx.selections["user.listname"] = """
some text to use for a subset selection
"""
Type:
dict[str, str]

property lists: dict[str, Mapping[str, str]]
lists:

ctx.lists["user.listname"] = ["word", "word2"]
ctx.lists["user.listname"] = {
    "pronunciation": "word",
}
Type:
dict[str, Union[list[str], dict[str, str]]]

property settings
settings:

ctx.settings = {
    "input_wait": 1.0,
}
Type:
dict[str, Any]

property tags
tags:

ctx.tags = ["user.terminal"]
Type:
frozenset[str]

property commands: Mapping[str, CommandImpl]
Return the commands defined by this Context

Type:
dict[str, CommandImpl]

property hotkeys: Mapping[str, ScriptImpl]
Return the hotkeys defined by this Context

Type:
dict[str, ScriptImpl]

class `talon.Module(name: str = None, *, desc: str = None)`

Creating a Module:

```python
from talon import Module
mod = Module()
action_class(cls: Class) → ActionClassProxy
@mod.action_class
class Actions:
    def action_name():
        "Description of the action"

    def second_action(arg1: int, arg2: str='') -> str:
        "Action with arguments, return type, and body"
        return 'test'
action(func: DecoratedT) → ActionDecl[DecoratedT]
@mod.action
def action_name():
    "Description of the action"
capture(*, rule: str) → Callable[[DecoratedT], DecoratedT]
capture(func: DecoratedT) → DecoratedT
@mod.capture
def capture_name() -> str:
    "Description of the capture"
scope(func: ScopeFunc) → ScopeDecl
@mod.scope
def scope():
    return {
        "key": "value",
    }

# call scope.update() at any time to force a scope update
setting(name: str, type: ~typing.Type[~talon.scripting.types.T], default: ~talon.scripting.types.T | ~talon.scripting.types.SettingDecl.NoValueType = <talon.scripting.types.SettingDecl.NoValueType object>, desc: str = None) → SettingDecl:l
"pop"

"hiss"

from talon import noise

def on_pop(active):
    print("pop")
noise.register("pop", on_pop)

def on_hiss(active):
    print("hiss", active)
noise.register("hiss", on_hiss)
talon.noise.unregister(topic: Any, cb: Callable) → None
Unregister a previously registered event:

noise.unregister("pop", on_pop)
©2023, Talon Voice LLC.

