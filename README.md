# Worthant's Neovim configuration

- [Installation](#install)
  - [Using symlinks (easier to mantain)](#symlink)
  - [Directly cloning (easier to install)](#direct)
- [Usage](#usage)
  - [Startup](#start)
  - [Mappings](#mappings)
- [TODOs](#todo)

<a id="install"></a>

## 🛠️ Installation

Generally, there are **2 ways** of installing anything into `.config/`

<a id="symlink"></a>

### 1. Clone repo anywhere you want, and create a soft link there

#### Clone the repository

```shell
git clone https://github.com/worthant/nvim.git <your_path>
```

#### Go into ~/.config and create a symbolic link

```shell
cd ~/.config
ln -s <path_to_cloned_repo> nvim
```

<a id="direct"></a>

### 2. Backup your files and just clone the repo into `.config/`

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/worthant/nvim.git ~/.config/nvim
```

<a id="usage"></a>

## Usage

<a id="start"></a>

### Start Neovim

```shell
nvim
```

<a id="mappings"></a>

### Mappings

> [!IMPORTANT] 
> If you want to discover all the keymaps - just press leader and
> then consecutively choose any command you want, they're well documented:
> |![image](https://github.com/user-attachments/assets/22492c4a-380c-456e-8f51-34f69ebbfb14)|
> |-|

#### UX

| Action           | Mappings      |
| ---------------- | ------------- |
| Glow Markdown    | `Leader + gw` |
| Preview Markdown | `Leader + md` |
| Toggle btop      | `Leader + tt` |
| Toggle lazygit   | `Leader + tl` |

#### Compile on the go

| Action           | Mappings      |
| ---------------- | ------------- |
| Compile `cpp`    | `Leader + cp` |
| Compile `python` | `Leader + pp` |

#### Terminal

| Action              | Mappings      |
| ------------------- | ------------- |
| Toggle any terminal | `F2`          |
| Float terminal      | `Leader + tf` |
| Horizontal terminal | `Leader + th` |
| Vertical terminal   | `Leader + tv` |

#### Sessions

| Action          | Mappings     |
| --------------- | ------------ |
| Search sessions | `Leader + r` |

#### Colorscheme

| Action        | Mappings      |
| ------------- | ------------- |
| Select scheme | `Leader + ft` |

#### Telescope

| Action                   | Mappings      |
| ------------------------ | ------------- |
| Find files               | `Leader + ff` |
| Find all files           | `Leader + fF` |
| Find words               | `Leader + fw` |
| Find words in all files  | `Leader + fW` |
| Find marks               | `Leader + f'` |
| Find man                 | `Leader + fm` |
| Find History (old files) | `Leader + fo` |
| Find registers           | `Leader + fr` |
| Find keymap              | `Leader + fk` |

<a id="todo"></a>

## TODOs:

- [ ] Add [jupyter inside nvim](https://github.com/dccsillag/magma-nvim)
- [ ] Add a preview for images in Markdown (use
      [this](https://github.com/3rd/image.nvim) plugin)
- [ ] Add all configs for lsp's, there shouldn't be any errors
- [ ] Add support for clojure (lsp, debug, e.t.c.)
- [ ] Add debugger for cpp, learn how to use it
- [ ] fix `Themery` plugin for changing themes
- [ ] Setup formatter and linter correctly (spend a whole session directly on this task)
  - [x] Python
  - [ ] Js/Ts
  - [ ] Rust
  - [x] C
  - [x] C++
  - [ ] Go
  - [ ] Java
  - [ ] Html, CSS, tailwind css, SCSS
  - [ ] Json, Yaml
  - [ ] ? CSV
  - Note: they shouldn't interfere with eachother. Now javascript is getting
    formatted by clang and other bs xD
- [x] Add custom mappings for compiling cpp files using my `cmp` script
- [x] Add custom mappings for neatly opening a terminal (**<leader>th can't
      close terminal - map to cntrl k and then close**)
- [x] Setup formatter(black) and linter(ruff) for `Python`, using null-ls plugin
- [x] Add lsp for java
- [x] Add xml formatter (`lemminx`)
- [x] Add custom mappings for markdown preview and glow
- [x] Merge `base` & `user` configs into monolithic config
- [x] Create a separate repo for mantaining merged config
- [x] Popup astronvim's notifications are annoying as hell - move them to the
      background or remove completely
- [x] add confiluration for null_ls and prettier formatters
- [x] add [multi-cursor plugin](https://github.com/smoka7/multicursors.nvim) for
      my setup
- [x] add preview plugins for markdown
  - [x] `markdown-preview`
  - [x] `glow`
- [x] Use those for a while and customise what i feel is needed
- [x] add `wakatime` plugin
- [x] add `lazygit`
- [x] add `bottom`
- [x] add lsp servers for js, ts, html, css, twcss
- [x] configure highlighting & personal theme
- [x] add config for clangd lsp server (need for `cpp`)
