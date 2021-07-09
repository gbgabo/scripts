<div align="center">

```
gabo's collection of personal
███████╗ ██████╗██████╗ ██╗██████╗ ████████╗███████╗
██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝██╔════╝
███████╗██║     ██████╔╝██║██████╔╝   ██║   ███████╗
╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   ╚════██║
███████║╚██████╗██║  ██║██║██║        ██║   ███████║
╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚══════╝
used in GNU/Linux system
```

Some bash scripts to solve my personal needs, maybe you find something useful for you!

</div>

## 🛠️ Scripts included

### `bctrl`

`brightness control`

- xrandr wrapper to handle volume

Usage:

- `bctrl` `<value|value+|value->`: set brightness by exact percentage value, or by increasing/decreasing the current one;

Dependencies:

- xrandr
- dunst (+ dunstify)
- grep
- cut
- tset
- tprogbar

---

### `vctrl`

`volume control`

- Alsa wrapper to handle volume

- `vctrl` `<value|value+|value->`: set volume by exact percentage value, or by increasing/decreasing the current one;

Dependencies:

- amixer
- dunst (+ dunstify)
- tset
- tprogbar

---

### `tset`

`tiny setter`

- Little script that handles global variables
- Let's you set, increase and decrease a variable (good for keybinds)
- Used on vctrl and bctrl

Usage:

`tset` can be used with the following options:

- `-s` `<variable>` `<value|value+|value->`: set value for variable in exact percentage value (0 to 100), or by increasing/decreasing the current one;

- `-g` `<variable>`: get value from specified variable

Example:

Set specific value:

```sh
tset -s battery-progress 20
```

Increase in a specific amount:

```sh
tset -s battery-progress 5+
```

Get current value:

```sh
tset -g battery-progress # 25
```

- current `<variable>` value is stored on /etc/`<variable>`.dat

---

### `passmenu`

`password menu`

- dmenu wrapper to copy password to clipboard

Dependencies:

- pass
- dmenu

---

### `tl`

`terminal launch`

Usage:

- `tl` `'command(s)'`: get value from specified variable

Example:

```sh
tl 'sudo apt update; apt list --upgradable'
```

---

## ⚙️ Installation

Edit Makefile to match where to install the script collection (installed into the /usr/bin namespace by default).

Afterwards, enter the following command to install the **script collection** (if necessary as root):

```sh
make install
```

Or if you want to install an specific tool, you can run:

```sh
make tl # if you want to install tl for example
```

To uninstall **all scripts** you can run:

```sh
make uninstall
```

### Todo

- implement media control

## ↗️ Other repositories to check

- [gbgabo/dotfiles](https://github.com/gbgabo/dotfiles): current dotfiles used in my system;
- [TinyTools](https://github.com/TinyToolSH): other cool scripts I write and use;
- [gbgabo/dwm](https://github.com/gbgabo/dwm): own fork of dwm, including many useful patches and own color theme;
- [gbgabo/dmenu](https://github.com/gbgabo/dmenu): dmenu fork with center patch and own color theme;
