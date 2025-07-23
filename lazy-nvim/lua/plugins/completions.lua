--[[ return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    vim.api.nvim_set_hl(0, "PopMenu", { bg = "#1F2335", blend = 0 })
    local cmp = require("cmp")
    local win_opt = {
      col_offset = 0,
      side_padding = 1,
      winhighlight = "Normal:PopMenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    }
    opts.window = {
      completion = cmp.config.window.bordered(win_opt),
      documentation = cmp.config.window.bordered(win_opt),
    }
    opts.experimental = {
      ghost_text = true,
    }
  end,
} ]]
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-emoji" },
  },
  opts = function(_, opts)
    table.insert(opts.sources, {
      { name = "emoji" },
      { name = "orgmode" },
    })
    local cmp = require("cmp")
    opts.completion = {
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
    }
    opts.window = {
      completion = cmp.config.window.bordered({}),
      documentation = cmp.config.window.bordered({}),
    }
    -- Set view to follow cursor while typing
    opts.view = {
      entries = {
        follow_cursor = true,
      },
    }
    opts.experimental = {
      ghost_text = true,
    }
    opts.snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
      end,
    }
  end,
}
--[[ return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        border = "rounded",
      },
      documentation = {
        window = {
          border = "rounded",
        },
      },
      ghost_text = {
        enabled = true,
      },
    },
  },
} ]]
