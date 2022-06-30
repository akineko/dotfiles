local wezterm = require 'wezterm';
local distro = "ubuntu";

return {
  default_prog = {"wsl.exe", "--distribution", distro, "--cd", "~"},
  font = wezterm.font("HackGenNerd Console"),
  font_size = 11,
  initial_cols = 200,
  initial_rows = 60,
  color_scheme = "Ayu Mirage",
--   color_scheme = "Dracula+",
--   color_scheme = "Japanesque",
--   color_scheme = "lovelace",
--   color_scheme = "OneHalfDark",
  mouse_bindings = {
    {
      event={Down={streak=1, button="Right"}},
      mods="NONE",
      action=wezterm.action{PasteFrom="Clipboard"}
    },
  },
}