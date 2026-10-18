# dotfiles

Dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi)

> **⚠️ WARNING! ⚠️**
> 
> **This set of configurations is not intended to be used** apart from research and/or study purposes, as contents of the repository are designed specifically for a **personalized workflow**, extending to the utilized Operating Systems, package managers, etc.

Apply:

```shell
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- \
  init \
    --apply lorilorimori \
&& ~/.local/share/chezmoi/packages.linux.sh
```

```powershell
powershell.exe `
  -ExecutionPolicy Bypass `
  -File ".local\share\chezmoi\packages.windows.ps1"
```

