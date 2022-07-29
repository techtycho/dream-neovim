-- Require the Comment module and handle possible exceptions
local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  vim.notify("Cannot find the Comment module")
  return
end

-- Setup comments
comment.setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    -- TS comments
    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}
