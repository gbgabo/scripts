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

## Scripts included

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

### Todo

- implement media control
