local wezterm = require "wezterm"

local config = wezterm.config_builder()

config = {

  front_end = "WebGpu",
  max_fps = 120,
  adjust_window_size_when_changing_font_size = false,
  automatically_reload_config = true,

  freetype_load_flags = 'NO_HINTING',
  freetype_load_target = 'Light',
  -- freetype_render_target = 'HorizontalLcd',

  enable_tab_bar = false,
  use_fancy_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE|MACOS_FORCE_ENABLE_SHADOW",
  window_background_opacity = 0.60,
  macos_window_background_blur = 30,

  color_scheme = "Poimandres",

  font = wezterm.font("MesloLGS Nerd Font Mono"),
  font_size = 16,

  window_padding = {
    left = 16,
    right = 16,
    top = 16,
    bottom = 16,
  },

  leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    {
      key = 's',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'v',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
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
    {
      key = "j",
      mods = "LEADER",
      action = wezterm.action.ActivatePaneDirection("Down")
    },
    {
      key = "k",
      mods = "LEADER",
      action = wezterm.action.ActivatePaneDirection("Up")
    },
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


-- alternative
-- color_scheme = "Catppuccin Mocha",
-- font = wezterm.font 'JetBrains Mono',
-- default_cursor_style = "SteadyUnderline",
-- default_cursor_style = "SteadyBlock",
