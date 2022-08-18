local home = os.getenv("HOME")
local db = require("dashboard")

db.custom_header = {
  "",
  "",
  "",
  "",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "",
  "Better than VSCode BTW",
  "",
  "",
}

db.preview_file_height = 12
db.preview_file_width = 80
db.custom_center = {
  { icon = "  ",
  desc = "Recently latest session                 ",
  shortcut = "SPC t l",
  action ="SessionLoad"},
  {icon = "  ",
  desc = "New File                                ",
  action =  "DashboardNewFile",
  shortcut = "SPC t h"},
  {icon = "  ",
  desc = "Find File                               ",
  action = "Telescope find_files find_command=rg,--hidden,--files",
  shortcut = "SPC t f"},
  {icon = "  ",
  desc ="Astronomy                               ",
  action =  "Telescope planets",
  shortcut = "SPC t b"},
  {icon = "  ",
  desc = "Find  word                              ",
  action = "Telescope live_grep",
  shortcut = "SPC t w"},
  {icon = "  ",
  desc = "Open Personal dotfiles                  ",
  action = "Telescope dotfiles path=" .. home .."/.dotfiles",
  shortcut = "SPC t d"},
}
