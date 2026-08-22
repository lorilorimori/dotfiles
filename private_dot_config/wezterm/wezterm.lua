local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Detect OS from target_triple
local is_macos = wezterm.target_triple:find("darwin") ~= nil
local is_linux = wezterm.target_triple:find("linux") ~= nil
local is_windows = wezterm.target_triple:find("windows") ~= nil

if is_macos then
  config.font_size = 17.0
else
  config.font_size = 13.0
end

config.window_background_opacity = 0.89
config.initial_rows = 22
config.initial_cols = 70

-- Set default shell per platform so profile loads (Starship, etc.)
if is_windows then
  config.default_prog = {"pwsh.exe", "-NoLogo"}
elseif is_macos then
  config.default_prog = {"zsh"}
elseif is_linux then
  config.default_prog = {"/usr/bin/zsh"}
end

-- Platform-specific super key modifier
local super_mod = "ALT"
if is_macos then
  super_mod = "CMD"
end

-- Copy/paste modifier: CTRL on Windows, super_mod elsewhere
local copy_paste_mod = "CTRL"
if not is_windows then
  copy_paste_mod = super_mod
end

config.keys = {

  -- Interrupt (Ctrl+C)
  {
    key = "c",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SendString("\x03"),
  },

  -- New tab
  -- Ctrl /
  {
    key = "/",
    mods = "CTRL|" .. super_mod,
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  -- copy
  {
    key = "c",
    mods = copy_paste_mod,
    action = wezterm.action.CopyTo('Clipboard'),
  },
  -- paste
  {
    key = "v",
    mods = copy_paste_mod,
    action = wezterm.action.PasteFrom('Clipboard'),
  },

  -- Split panes
  -- Ctrl Super arrows
  {
    key = "DownArrow",
    mods = "CTRL|" .. super_mod,
    action = wezterm.action{SplitPane={direction="Down"}},
  },
  {
    key = "LeftArrow",
    mods = "CTRL|" .. super_mod,
    action = wezterm.action{SplitPane={direction="Left"}},
  },
  {
    key = "RightArrow",
    mods = "CTRL|" .. super_mod,
    action = wezterm.action{SplitPane={direction="Right"}},
  },
  {
    key = "UpArrow",
    mods = "CTRL|" .. super_mod,
    action = wezterm.action{SplitPane={direction="Up"}},
  },

  -- Resize panes
  -- Ctrl Shift arrows
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({"Left", 1}),
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({"Right", 1}),
  },
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({"Up", 1}),
  },
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = wezterm.action.AdjustPaneSize({"Down", 1}),
  },

  -- Switch panes
  -- Super arrows
  {
    key = "LeftArrow",
    mods = super_mod,
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "RightArrow",
    mods = super_mod,
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "UpArrow",
    mods = super_mod,
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = super_mod,
    action = wezterm.action.ActivatePaneDirection("Down"),
  },

  -- Switch tabs
  -- Shift Super
  {
    key = "LeftArrow",
    mods = "SHIFT|" .. super_mod,
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "RightArrow",
    mods = "SHIFT|" .. super_mod,
    action = wezterm.action.ActivateTabRelative(1),
  },

  -- Scroll
  -- Shift Super
  {
    key = "UpArrow",
    mods = "SHIFT|" .. super_mod,
    action = wezterm.action.ScrollByPage(-1),
  },
  {
    key = "DownArrow",
    mods = "SHIFT|" .. super_mod,
    action = wezterm.action.ScrollByPage(1),
  },

  -- Close pane
  -- Shift Super w
  {
    key = "W",
    mods = "SHIFT|" .. super_mod,
    action = wezterm.action.CloseCurrentPane({confirm=true}),
  },

}

return config
