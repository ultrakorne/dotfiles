-- Octo (GitHub PRs/issues in Neovim).
return {
  {
    "pwntester/octo.nvim",
    opts = {
      -- LazyVim's util.octo extra turns on Projects v2, which needs the `read:project`
      -- scope on the gh token -- without it, PR buffers fail to load entirely.
      -- Turning it off keeps reviews working with the plain `repo` scope.
      -- If you ever want Projects v2 timeline events: run `gh auth refresh -s read:project`
      -- on each machine and drop this line.
      default_to_projects_v2 = false,
    },
    -- LazyVim's extra also maps the which-key group prefixes (<localleader>v, <localleader>p,
    -- <localleader>c, ...) to an empty rhs just to get a group label. That makes `\v` a
    -- *complete* mapping, so Vim fires the no-op unless you finish `\vs` within 'timeoutlen'
    -- (300ms) -- which is why the review keys seemed dead. Drop the label-only stubs;
    -- which-key still shows the real octo mappings when you pause on `\`.
    keys = function(_, keys)
      return vim.tbl_filter(function(key)
        return key[2] ~= ""
      end, keys)
    end,
  },
  -- Octo applies its buffer-local `\...` mappings only after the gh fetch returns, which is
  -- long after which-key's BufEnter scan -- so which-key never learns `\` is a prefix, and
  -- plain Vim rules apply: you'd have 'timeoutlen' (300ms) to finish `\vs` or it silently
  -- does nothing. Registering `\` as an explicit trigger makes which-key hijack it and wait.
  {
    "folke/which-key.nvim",
    opts = {
      triggers = {
        { "<auto>", mode = "nxso" },
        { "\\", mode = "n" },
      },
    },
  },
}
