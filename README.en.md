# Nx IDE

*[Українською](README.md)*

A programming environment for [NyxilumLang](https://github.com/Faneraiy14/NyxilumLang), written
**in NyxilumLang itself**. For anyone starting to program, and for those who already can.

- **Blocks** - like Scratch: a hero on the stage, drawing, lists, your own blocks; code ↔ blocks.
- **Code** - like VS Code: any folder (Ctrl+O), completion, F12/F2, replace, code folding, split editor, debugger, a stage for games.
- **Learning** - lessons with auto-checks and "Show me", examples, error hints in plain language.
- **Tools** - a real terminal (bash/cmd, colors, vim), git (pick files to commit, history), version history, extensions (Anylint; your own are written in NyxilumLang).
- **Look** - themes, antialiased fonts, UI scale, a side drawer; settings with sections and search; updates with a button inside the IDE.

The interface and lessons are in Ukrainian. Details - [GUIDE.md](GUIDE.md).

| Blocks and the stage | Code and console |
|---|---|
| ![Blocks: the "Catch the star" game on the stage](assets/screenshots/blocks.png) | ![Code: a program asks for a name](assets/screenshots/code.png) |
| **Lessons and "Show me"** | **Git** |
| ![Lesson 1 done](assets/screenshots/lessons.png) | ![Git: what changed since the commit](assets/screenshots/git.png) |
| **Terminal and the light theme** | |
| ![Terminal: git log and nx](assets/screenshots/terminal.png) | |

## Quick start

1. Download the installer from **[Releases](../../releases/latest)**: Windows - `NxIDE-win-x64-setup.exe`, Ubuntu - `NxIDE-linux-x64.deb`.
2. Install: "Next → Finish" (Windows) or double click → "Install" (Ubuntu).
3. Open the **"Nx IDE"** shortcut → choose "Beginner" («Новачок») → the IDE gives a tour and opens lesson 1.

## Requirements

| | |
|---|---|
| **System** | Windows 10/11 (64-bit) or Linux x64 (Ubuntu 20.04+, Debian 11+ and similar) with a graphical desktop (X11, or Wayland with XWayland - the Ubuntu default) |
| **Memory** | ~100 MB for the IDE itself (+ running programs); comfortable - 2 GB on the computer |
| **Disk** | ~100 MB (Linux), ~200 MB (Windows) |
| **Screen** | 1024×640 or larger; UI scale 100-200% is available |
| **.NET, Java, Python** | not needed - NyxilumLang is bundled |
| **Internet** | only for download and updates |
| **Optional** | `git` - for the Git panel; `php` and [Anylint](https://github.com/Faneraiy14/anylint) - for code checks by the Anylint extension |

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

## Troubleshooting

| Problem | What to do |
|---|---|
| Windows: "Windows protected your PC" | "More info" → "Run anyway". The installer isn't signed with a paid certificate; the code is open - you can see what it does |
| The antivirus complains or deletes a file | Same reason: an unsigned program. Add the Nx IDE folder to the antivirus exceptions or write in [Issues](../../issues) |
| Ubuntu: double clicking the `.deb` does nothing | In a terminal: `sudo apt install ./NxIDE-linux-x64.deb` |
| Ubuntu: the desktop shortcut doesn't start | Right click the shortcut → "Allow Launching" |
| No window appears (Linux) | X11 or XWayland is needed. Check `echo $DISPLAY` in a terminal - it should print something like `:0`. Run `nx-ide` from a terminal to see the error |
| Ukrainian letters don't type | Switch the layout as usual (the IDE sees it). If it still doesn't work - write in Issues which system and layout you use |
| A program "hangs" (an infinite loop) | The red "Stop" button at the top or Shift+F5 |
| "Update" didn't work | Internet is needed. If installed from a `.deb` - download the new `.deb` from the releases page |
| Anylint says "Anylint not found" | It's an optional extension that needs `php` and Anylint. Don't need it - disable it in "Extensions" |
| I want a clean start | Delete the settings: `~/.nyx-ide/налаштування.json` (Windows: `%USERPROFILE%\.nyx-ide\`). Programs are not touched |
| The IDE showed "Internal IDE error" | Your work is already saved. Details are in `~/.nyx-ide/помилки.log`; send them in [Issues](../../issues) |

## Known limitations

- **macOS** - not yet: the IDE window uses X11, which a Mac doesn't have without XQuartz.
- **"Open as blocks"** handles only simple programs: `struct`, `return`, `try/catch`, arrays with `[0]`, `for x in list`, a loop counter used in the body can't be built from blocks (the IDE explains what and on which line).
- **The terminal** on Windows (cmd via ConPTY) is less tested than on Linux.
- **Git** - changes, picking files to commit, discarding a file's changes, commit history, branches, push/pull. Resolving conflicts - in the terminal or another tool for now.
- **The editor** - a single cursor (no multi-cursor), no minimap.
- **The interface and lessons** are Ukrainian only.
- **The Windows version** hasn't been tested much on real computers yet.

## Roadmap

- macOS (a native window without X11)
- English interface and lessons
- more lessons and examples (games, animations, sound)
- shared projects: share a program with a link
- resolving Git conflicts inside the IDE
- multiple cursors in the editor
- extensions with their own panels and hints
- a better "code → blocks" converter

## License

[MIT](LICENSE) - free to use, change and share, keeping the author's credit.
Fonts: Noto Sans / Noto Sans Mono and Terminus - [SIL Open Font License](https://openfontlicense.org).

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
| Ctrl+O | open another folder |
| Ctrl+P / Ctrl+Shift+P | quick-open a file / all commands |
| Ctrl+F / Ctrl+H | find / replace in the file (Tab - between fields, Ctrl+Enter - replace all) |
| Ctrl+Shift+F / Ctrl+Shift+H | find / replace in all files |
| Alt+↑ / Alt+↓ | move the line up / down (with Shift - copy) |
| Ctrl+Shift+[ / Ctrl+Shift+] | fold / unfold a `{ }` block (or the arrow next to the line number) |
| Ctrl+B / Ctrl+J / Ctrl+` | side drawer / bottom panel / terminal |
| F12 / F2 | go to definition / rename everywhere |

The full list - in [GUIDE.md](GUIDE.md).

## Tests

All tests run without a window (scenarios, a "monkey" doing random actions):

```bash
bash tests/run_all.sh
```
