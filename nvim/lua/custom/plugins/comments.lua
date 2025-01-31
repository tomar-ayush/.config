return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      pre_hook = function(ctx)
        local U = require 'Comment.utils'

        -- Determine whether to use line comments or block comments
        local type = ctx.ctype == U.ctype.line and 'line' or 'block'

        -- Set the comment string based on the file type
        local comment_string = {
          line = '// %s',
          block = '{/* %s */}',
        }

        return comment_string[type]
      end,
    }
  end,
}
