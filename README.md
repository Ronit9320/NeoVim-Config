# Neovim Configuration

This is my custom Neovim configuration, designed to enhance productivity and streamline development with modern tools and features.

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Ronit9320/nvim-config.git ~/.config/nvim
   ```

2. **Install dependencies**:
   Ensure you have Neovim (v0.8 or newer), along with the following:
   - [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management
   - `tree-sitter` and `clangd` for syntax highlighting and LSP support

3. **Install plugins**:
   Open Neovim and run:
   ```vim
   :Lazy install
   ```

## Features

- **Rose Pine Colorscheme**: A soothing and modern aesthetic.
- **Telescope**: Fuzzy finder for files, buffers, and more.
- **Tree-sitter**: Advanced syntax highlighting and code parsing.
- **LSP (clangd)**: Language Server Protocol for C++ development.

## Usage

- Open Neovim: `nvim`
- Access the fuzzy finder: `<leader>ff`
- Open file explorer: `<leader>e`
- Manage plugins: `:Lazy`

## Adding Plugins

To add new plugins, place them in the `~/.config/nvim/lua/plugins/` directory as separate Lua files. They will be automatically loaded by Lazy.nvim.

## Customization

Feel free to tweak the configuration files in `~/.config/nvim/lua/` to suit your workflow.

## Credits

Inspired by various Neovim setups and community plugins.


