# dotfiles

Dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi)

> [!CAUTION]
> This __set of configurations is not intended to be used__ apart from research and/or study purposes, as contents of the repository are designed specifically for a personalized workflow, extending to the utilized Operating Systems, package managers, etc.

Apply:

```shell
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply lorilorimori && ~/.local/share/chezmoi/packages.linux.sh

```powershell
powershell.exe -ExecutionPolicy Bypass -File ".local\share\chezmoi\packages.windows.ps1"
```

## Contents

- [dotfiles](#dotfiles)
  - [Contents](#contents)
  - [🌻 Shell](#-shell)
  - [.⚙️ Configurations](#️-configurations)

## 🌻 Shell

*`.zchrc`*

[ZSH](https://wiki.archlinux.org/title/Zsh) shell is configured with [Zinit](https://github.com/zdharma-continuum/zinit) plugin manager and [Pure prompt](https://github.com/sindresorhus/pure) recolor.

## .⚙️ Configurations

Non-GUI packages and applications are installed through multiple package managers - including system and language-based ones.

GUi applications are usually installed using Flatpak.

For Windows, Winget and Nuget are used.
