local wezterm = require "wezterm"

local config = wezterm.config_builder()

config = {
  -- performance
  front_end = "WebGpu",
  max_fps = 144,
  animation_fps = 10,

  enable_tab_bar = false,

  -- theme
  color_scheme = "Poimandres Alternate",
  color_scheme_dirs = { '~/.config/wezterm/theme/poimandres.toml' },

  -- appearance
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE|MACOS_FORCE_ENABLE_SHADOW",
  window_background_opacity = 0.60,
  window_padding = { left = 16, right = 16, top = 16, bottom = 16 },
  macos_window_background_blur = 30,

  -- font
  font_size = 16,
  font = wezterm.font("MesloLGS Nerd Font Mono"),
  freetype_load_flags = 'NO_HINTING',
  freetype_load_target = 'Light',

  -- keybind
  leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    { key = 's', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'v', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    {
      key = "h",
      mods = "LEADER",
      action = wezterm.action_callback(function(window, pane)
        local tab = window:mux_window():active_tab()
        if tab:get_pane_direction("Left") ~= nil then
          window:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
        else
          window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
        end
      end),
    },
    { key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
    {
      key = "l",
      mods = "LEADER",
      action = wezterm.action_callback(function(window, pane)
        local tab = window:mux_window():active_tab()
        if tab:get_pane_direction("Right") ~= nil then
          window:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
        else
          window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
        end
      end)
    }
  }
}

return config

-- default_cursor_style
