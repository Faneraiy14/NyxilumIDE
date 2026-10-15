# Nx IDE Guide

*[Українською](ПОСІБНИК.md)*

Nx IDE is a place to learn programming from zero and then write real programs in
**NyxilumLang**. It has two modes:

- **Blocks** - you build a program from colored blocks with the mouse, like in Scratch.
- **Code** - you write the program in words, like real programmers.

Every block program is real code, so you can move from blocks to code at any time.

The IDE interface and lessons are in Ukrainian. In this guide the original label is
given in parentheses, e.g. **Run** («Запустити»), so you can find it on screen.

## First launch

Open the **"Nx IDE"** shortcut (desktop, Start menu or app menu) - for installation see
the [README](README.en.md). Programs are kept in `~/NyxПрограми`. From the terminal:

```bash
nx-ide                  # the standalone Nx IDE app (Linux)
nx ide ~/MyFolder       # from NyxilumNode - any folder (even a whole project)
```

First the IDE asks: **"Who are you in programming?"** («Хто ти в програмуванні?»)

- **Beginner** («Новачок») - a tour of the IDE right away, then lesson 1.
- **Intermediate** («Середній») - blocks and lessons are there, but the guide is only offered, not pushed.
- **Advanced** («Просунутий») - blocks and lessons are off (can be turned on in Settings).

At any level, the first time you open something new (blocks, code, history,
extensions), a card appears at the bottom right: **"Show how this works?"** with
**Show** («Показати»), **No thanks** («Не треба») and **Don't offer** («Не пропонувати»).

## The window (like VS Code)

- **Left bar** - Explorer, Search in files, Version history, Git, Learning,
  Extensions; at the bottom - **Settings** (gear). Clicking an icon opens the
  side panel, clicking again (or the ‹ arrow, or Ctrl+B) collapses it.
- **Explorer** - folders and files (folders expand). Header icons: new file,
  new folder, refresh, collapse all. A new file's name is typed right in the tree:
  no extension - an `.nx` program, `.nxb` - a block program, anything else (`.md`,
  `.txt`...) - plain text. Right click a file or folder - New file, New folder,
  Rename (or F2), Delete (with confirmation), Copy path.
- **Tabs** - every open file; a dot - unsaved, a cross - close (Ctrl+W, middle
  mouse button), Ctrl+Tab - next tab.
- **Bottom panel** - "Console", "Problems" (errors and hints linking to the line),
  "Variables" (during step-by-step runs) and "Terminal". Ctrl+J - hide/show.
- **Status bar** - git branch, number of problems (click - "Problems"), line and
  column, file language. Orange - while a program is running.
- **Command palette** - the field at the top or Ctrl+Shift+P: any command by name.
  Ctrl+P - quickly open a file, Ctrl+Shift+F - search in all files.

**Updates:** once a day the IDE quietly checks whether a new version is out. If so, an
**Update** («Оновити») card appears (the update runs in the IDE terminal, then **Restart**).
It can be turned off in Settings ("Check for updates"). If installed from a `.deb`
package, the card leads to the release page.

The IDE remembers what was open in each folder: tabs, cursor positions, the split
editor, the side panel (`.nyx/сесія.json`) - everything is back after a restart.

## Settings

The gear at the bottom of the left bar: level (beginner / intermediate / advanced),
switches **Blocks mode**, **Lessons and learning**, **Error hints**, **Offer the guide**,
a "Show offers again" button and the tour. Settings are shared by all folders
(`~/.nyx-ide/налаштування.json`).

Also there: **Theme** (dark, light, high contrast), **Pixel font** (by default -
antialiased Noto Sans for the interface and Noto Sans Mono for code), **UI scale**
100-200% (for large screens; the code font separately - Ctrl+= / Ctrl+-), **Check for
updates**, the IDE version and **Check now**.

## Learning

The **Learning** icon (a book) in the left bar opens lessons and examples.

- Lessons 1-11 - "Blocks" mode, 12-17 - "Code" mode. Each lesson is its own clean
  program ("Урок 1", "Урок 2", ...), so blocks from different lessons don't mix.
- Each lesson checks itself: as soon as the program does what it should,
  **"√ Done!"** appears - with confetti.
- The **"▶ Show me"** («Покажи мені») button - the IDE moves the cursor itself, builds
  the program and runs it. Watch, then try it yourself. Escape - stop the demo.
- The **Examples** tab - ready programs: "Guess the number", "Times table",
  "Countdown", "Shopping list", "Sun" (a drawing), "Steer the circle" (a game with
  arrow keys), "Cat walks", "Rocket", "Catch the star" (a game), "Cat walks in
  squares" (own blocks), "hello" (code). An example is copied into your programs -
  you can change it.

## Blocks mode

| What to do | How |
|---|---|
| Add a block | drag it from the palette (or just click it) |
| Connect blocks | bring a block under another - it snaps (a white strip shows where) |
| Put inside "repeat", "if" | drop the block into the notch inside |
| Insert a value | drop round and hexagonal blocks into the slots of other blocks |
| Change a number or text | click the white slot and type, Enter - done |
| Choose a variable, color, key | click the slot with a small triangle |
| Delete | drag the block back to the palette, or right click → "Delete" |
| Copy | right click → "Duplicate" |
| Move the workspace | drag an empty spot, mouse wheel, Shift+wheel |
| Start over | the "Start over" button - only the yellow hat stays (Ctrl+Z - bring back) |
| Undo | Ctrl+Z (redo - Ctrl+Y) |
| See the code | "Show code"; "Open as code" - turn the program into a code file |

A program runs only if its blocks are attached under the yellow hat
**"when «Run» is clicked"**. If the program fails with an error, the block where it
happened is outlined in red.

### Categories

- **Events** (yellow) - where the program starts.
- **Output** (blue) - say, ask.
- **Control** (orange) - repeat, while, if/else, wait, stop.
- **Variables** (orange-red) - remember a value, increase, the variable itself;
  lists (add, item, length, contains, clear - numbering starts at 1).
- **Operators** (green) - math, comparisons, joining text, random numbers.
- **Motion** (light blue) and **Looks** (lilac) - the **hero** on the stage, like a
  Scratch sprite: go, turn, go to a point, bounce off edges; costumes (cat, ball,
  rocket, star, robot), speech bubbles, size, background color.
- **Drawing** (purple) - circle, rectangle, line, text, "show the picture" (without
  it nothing is visible), keys and mouse for games.
- **My blocks** (pink) - your own blocks, like "Make a Block" in Scratch.
  "+ Make a block" → a name, parameters in parentheses: `wave (times)`. Under the pink
  hat "define wave (times)" you build what the block does (the round "times" block is
  the number passed in), and the "wave" block itself appears in the palette. In code
  it is the function `func wave(times) { ... }`; variables are then shared by the whole
  program.

### Code ↔ blocks

- **"Open as code"** (a button above the workspace) - a block program becomes a
  regular `… (код).nx` file.
- **"Open as blocks"** (right click an `.nx` file in the Explorer, or the command
  palette "Code: open as blocks") - the other way: a simple code program becomes
  `… (блоки).nxb`. Works for what can be built from blocks: `print`, variables,
  `for i in 0..10`, `while`, `if/else`, drawing, the hero, lists, your own functions
  (they become "My blocks"). If something can't be built from blocks (`struct`,
  `return`, a loop counter used in the body...) - the console explains it with the
  line number.

The **stage** appears on the right right inside the IDE as soon as a program draws
something. Click it - keys and mouse go to the program (Escape - give them back to the
IDE). Code programs that open a window (`surfaceOpen`) are shown on the stage too.

## Step-by-step run (debugging)

The **Step by step** («Крок за кроком») button (F10) runs the program so that it stops
on every line (in blocks - on every block, outlined in yellow). At the bottom, in the
**Variables** tab, you see all variables and their values.

| Keys | Action |
|---|---|
| F10 | step (next line, without going into functions) |
| F11 | step into a function |
| Shift+F11 | step out of a function |
| F5 | continue - to the next breakpoint |
| Shift+F5 | stop |

**Breakpoint** - click a line number (a red dot). F5 with breakpoints runs the program,
and it stops on them by itself.

## Version history

The **Version history** icon (a clock) in the left bar - a little "git" inside the IDE.

- **"+ Save version"** - a snapshot of the program with a short description of what
  changed (in git this is called a *commit*).
- Click a version - **what changed since then**: new lines in green with "+", removed
  ones in red with "-" (like `git diff`). For blocks, their code is compared.
- **"Restore this version"** - the program becomes what it was then. The current state
  is saved as a version first, so nothing is lost (and Ctrl+Z works).

## Code mode

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
| Ctrl+F | find in file (Enter - next, Shift+Enter - previous, Esc - close) |
| Ctrl+Shift+P / Ctrl+P | command palette / open a file |
| Ctrl+Shift+F | search in all files |
| Ctrl+B / Ctrl+J | side / bottom panel |
| Ctrl+W / Ctrl+Tab | close tab / next tab |
| Drag a tab | reorder tabs |
| Drag a file/folder in the Explorer | move it to another folder (open tabs are updated) |
| F12 / Ctrl+click | go to definition (a function, a variable - in another file too) |
| Ctrl+` | terminal (the "Terminal" tab at the bottom) |
| Ctrl+\ | split the editor into two panes (click a pane - it becomes active, a file from the Explorer opens in it) / unsplit |
| F2 | rename everywhere (a local variable - in its function, a function - in all files; Ctrl+Z - undo) |

With the cursor on a name, its other occurrences in the code are highlighted (not in
"..." strings or comments).

While you type a name, **suggestions** appear: functions, variables, language words.
↑/↓ - choose, Enter or Tab - insert (a built-in function - with parentheses right
away), Esc - hide.

**Terminal** (Ctrl+` or the "Terminal" tab) - system commands in the project folder:
`nx program.nx`, `git status`, `ls`/`dir`... `cd` and `clear` work as usual, ↑/↓ -
previous commands, Ctrl+C - stop, Escape - back to the editor. While a command runs,
what you type goes to it (like in the console).

If a program asks for input (`readLine`), type the answer at the bottom, in the console
field, and press Enter. If a program fails, the line with the error is highlighted in
red and the cursor jumps to it. Under the error in the console there is a yellow
**hint** in plain words (and "did you mean ...?" if a name looks like another one).

## Git

The **Git** icon (a branch) in the left bar - real git, like in VS Code: the current
branch (and `↑/↓` - how many commits are not pushed / not pulled yet), **Commit**
(the description - in a dialog; all changes are committed), **Pull**/**Push** (in the
terminal - you see the server's answer there), the list of changed files (U - new,
M - modified, D - deleted; the same letters and colors are in the Explorer). Click a
file - what changed since the last commit. Branches: click the branch name - the
list, switch, "+ New branch". The branch is also shown at the left of the status bar.
Not a repository yet - the "Create repository" button. The service folder `.nyx/`
never goes into git.

## Extensions

The **Extensions** icon (four squares) in the left bar. Extensions are written
**in the same NyxilumLang**:

- **Anylint** (built in) - static analysis: after every save the file is checked in
  the background, findings go to "Problems" and a colored strip in the editor gutter.
  Needs `php` and [Anylint](https://github.com/Faneraiy14/anylint) (the path - the
  `ANYLINT_BIN` variable, otherwise it looks in `~/Projects/anylint`). The command
  "Anylint: Check the whole project" - in the palette (Ctrl+Shift+P), output - in the
  terminal. "Open" on a built-in extension makes your own copy (the built-in one stays
  untouched).
- **"+ Create"** - a template for your own extension in `~/.nyx-ide/розширення/<name>`:
  `extension.json` (name, which files to check, commands), `lint.nx` (the check: gets
  the file path, prints a JSON array of findings `[{"line", "severity", "message",
  "rule"}]`) and `hello.nx` (a command: gets the project folder and the current file).
  Change `lint.nx`, save any `.nx` file - and you'll see the result. "Refresh" - re-read
  the list, "Disable" - turn it off (remembered).

## For IDE developers

The IDE is written in NyxilumLang (`src/`, entry point - `src/ide.nx`). All tests run
without a window (each on a temporary folder with its own settings file):

```bash
bash tests/run_all.sh
```

Block examples are generated by `nx tools/make_examples.nx`.
