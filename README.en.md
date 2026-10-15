# Nx IDE

*[Українською](README.md)*

A programming environment for [NyxilumLang](https://github.com/Faneraiy14/NyxilumLang), written
**in NyxilumLang itself**. For anyone starting to program, and for those who already can.

- **Blocks** - like Scratch: a hero on the stage, drawing, lists, your own blocks; code ↔ blocks.
- **Code** - like VS Code: completion, F12/F2, split editor, debugger, a stage for games.
- **Learning** - lessons with auto-checks and "Show me", examples, error hints in plain language.
- **Tools** - terminal, git, version history, extensions (Anylint; your own are written in NyxilumLang).
- **Look** - themes, antialiased fonts, UI scale; updates with a button inside the IDE.

The interface and lessons are in Ukrainian. Details - [GUIDE.md](GUIDE.md).

## Download

A standalone app with the language bundled - nothing else to install.
Release page: **[Releases](../../releases/latest)**.

| System | What to download |
|---|---|
| **Windows** | **`NxIDE-win-x64-setup.exe`** - "Next → Finish", no admin rights; an "Nx IDE" shortcut on the desktop and in the Start menu. If Windows shows "Windows protected your PC" - "More info" → "Run anyway" (the installer isn't signed with a paid certificate) |
| **Ubuntu / Debian** | **`NxIDE-linux-x64.deb`** - double click → "Install"; an "Nx IDE" shortcut in the menu, the `nx-ide` command |
| **Linux, one command** | `curl -fsSL https://raw.githubusercontent.com/Faneraiy14/NyxilumIDE/main/install.sh \| bash` (no sudo) |
| **macOS** | not yet: the IDE window uses X11 |

Updating - the "Update" button inside the IDE (or a new `.deb`).

If you write in the terminal - the language on its own, like Node.js: [NyxilumNode](https://github.com/Faneraiy14/NyxilumNode)
(it has the IDE too: `nx ide`).

## From a clone of this repo

```bash
nx src/ide.nx
NX_IDE_HOME=/path/to/NyxilumIDE nx ide
```

## Keyboard shortcuts

| Keys | Action |
|---|---|
| F5 / Ctrl+R | run / stop |
| Ctrl+S | save (it also saves before running and on exit) |
| Ctrl+Z / Ctrl+Y | undo / redo |
| Ctrl+C / Ctrl+X / Ctrl+V | copy / cut / paste (no selection - the whole line) |
| Ctrl+A | select all |
| Ctrl+/ | comment lines |
| Ctrl+D | duplicate line |
| Tab / Shift+Tab | indent / unindent |
| Ctrl+= / Ctrl+- / Ctrl+wheel | bigger / smaller font |
| Ctrl+N | new program |

The full list - in [GUIDE.md](GUIDE.md).

## Tests

All tests run without a window (scenarios, a "monkey" doing random actions):

```bash
bash tests/run_all.sh
```
