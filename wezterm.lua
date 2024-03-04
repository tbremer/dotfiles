-- Pull in the wezterm API
local wezterm = require("wezterm")

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "rose-pine-moon" -- Builtin Solarized Dark'
  else
    return "rose-pine-dawn" -- Builtin Solarized Light'
  end
end

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
--
-- For example, changing the color scheme:
config.color_scheme = scheme_for_appearance(get_appearance())

-- User configs
config.font = wezterm.font("MonaspiceAr Nerd Font Mono")
config.font_size = 15

config.window_frame = {
  font = wezterm.font({ family = "MonaspiceAR Nerd Font Mono", weight = "Light" }),
  font_size = 13.66,
}

-- and finally, return the configuration to wezterm
return config
