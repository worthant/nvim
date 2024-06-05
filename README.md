# Worthant's AstroNvim configuration

A user configuration template for
[AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

> [!CAUTION]  
> I am dropping AstroNvim config in favour of my own core in the mean time

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone this repo

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store
your user configuration.

You can also just clone this repository directly if you do not want to track
your user configuration in GitHub.

#### Clone the repository

```shell
git clone git@github.com:worthant/neovim.git ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

## TODOs:

- [ ] Popup astronvim's notifications are annoying as hell - move them to the background or remove completely
- [ ] Add all configs for lsp's, there shouldn't be any errors
- [ ] Setup formatter and linter correctly (typescript, javascript, c)
  - Note: they shouldn't interfere with eachother. Now javascript is getting formatted by clang and other bs xD
- [x] Add lsp for java
- [x] Add xml formatter (`lemminx`)
- [ ] Add custom mappings for compiling cpp files using my `cmp` script
- [ ] Add custom mappings for neatly opening a terminal (**<leader>th can't
      close terminal - map to cntrl k and then close**)
- [x] Add custom mappings for markdown preview and glow
- [ ] Add support for clojure (lsp, debug, e.t.c.)
- [ ] Add debugger for cpp, learn how to use it
- [ ] fix `Themery` plugin for changing themes
- [x] add confiluration for null_ls and prettier formatters
- [x] add [multi-cursor plugin](https://github.com/smoka7/multicursors.nvim) for
      my setup
- [ ] Try `Neorg`
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

## Mappings

### Custom

| Action           | Mappings      |
| ---------------- | ------------- |
| Glow Markdown    | `Leader + gw` |
| Preview Markdown | `Leader + md` |

### Terminal

| Action              | Mappings      |
| ------------------- | ------------- |
| Horizontal terminal | `Leader + th` |
| Vertical terminal   | `Leader + tv` |
| Toggle any terminal | `1`           |

### Sessions

| Action       | Mappings     |
| ------------ | ------------ |
| All sessions | `Leader + r` |

### Colorscheme

| Action        | Mappings      |
| ------------- | ------------- |
| Select scheme | `Leader + ft` |
