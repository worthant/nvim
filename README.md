# Worthant's Neovim configuration

- [Showcase](#showcase)
- [Installation](#install)
  - [Using symlinks (easier to mantain)](#symlink)
  - [Directly cloning (easier to install)](#direct)
- [Usage](#usage)
  - [Startup](#start)
  - [Mappings](#mappings)
- [TODOs](#todo)

<a id="showcase"></a>

## Showcase

- LaTeX live preview

|![image](https://github.com/user-attachments/assets/93ba8fc3-5665-4a34-80b5-8c4834af06f7)|
|-|

- Debugger

|![image](https://github.com/user-attachments/assets/0c707052-7717-40f3-8942-fe7faff1e278)|
|-|

- Stylish markdown & flexible kitty terminal layout

|![image](https://github.com/user-attachments/assets/d2ece403-c7af-4fdf-9881-1123c2f4dd35)|
|-|

- Telescope (find anything)

|![image](https://github.com/user-attachments/assets/0131a8a7-93be-4abd-b690-d82ab4247d01)|![image](https://github.com/user-attachments/assets/a883d182-2922-4ccd-928d-3d27881288dc)|
|-|-|
|![image](https://github.com/user-attachments/assets/0e60d795-2757-476d-87aa-b9a217e2f3f2)|![image](https://github.com/user-attachments/assets/7cf23e2e-51a4-4719-915c-a126ea3d6555)|
|![image](https://github.com/user-attachments/assets/2bf338e5-0797-4609-b66a-81e1ab8865f5)|![image](https://github.com/user-attachments/assets/c5101e54-4e24-4760-8eff-f59b41525aef)|
|![image](https://github.com/user-attachments/assets/ca78ef58-d6a9-4f4d-8de1-26bd8464800a)|![image](https://github.com/user-attachments/assets/218f1bb8-2fab-4fe9-818e-8b7039d1cb23)|

- Session-scoped terminal

|![image](https://github.com/user-attachments/assets/291587b0-e57f-487e-aabd-9f12fdcd2627)|![image](https://github.com/user-attachments/assets/4d7e436c-be03-474c-a34b-701108ca192c)|
|:-:|:-:|
|horizontal|vertical|
|![image](https://github.com/user-attachments/assets/a79322e1-c74e-4d74-94d3-81ba7ca86205)|<- floating|

- Autocomplete commands

|![image](https://github.com/user-attachments/assets/03144edb-162f-49d4-8692-36d6c6a9eaf6)|![image](https://github.com/user-attachments/assets/e19c1fda-cc68-4a26-980f-4f3fac299ed3)|
|:-:|:-:|

- Sessions management

|![image](https://github.com/user-attachments/assets/94417ceb-d0bb-44cf-a5ef-826631cfe1f4)|
|-|

- Lazygit

|![image](https://github.com/user-attachments/assets/0d3313bd-f45e-429e-b93d-275c2aa622ad)|![image](https://github.com/user-attachments/assets/3bbd269e-8a0a-46be-b455-87edcc592fc9)|
|-|-|

- btop / btm

|![image](https://github.com/user-attachments/assets/736d362f-8fc9-4514-88ce-984c4463a126)|![image](https://github.com/user-attachments/assets/cd9cbc05-0e69-4b49-9271-1bca5fb706dd)|
|-|-|






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

- [ ] Add [discord rich presence](https://github.com/andweeb/presence.nvim?tab=readme-ov-file#notes) for fun
- [ ] Change `rendermarkdownh6bg` colors (h1-h6) to match my colorscheme 
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
