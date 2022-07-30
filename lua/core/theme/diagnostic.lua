local colors = require("core.theme.colors")

local highlight = {}

for k, v in pairs(highlight) do
  colors.add_color(k, v, "#")
end

colors.update_colors()
