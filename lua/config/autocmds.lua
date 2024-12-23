-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local modified = false
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if normal.bg then
      io.write(string.format("\027]11;#%06x\027\\", normal.bg))
      modified = true
    end
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    if modified then
      io.write("\027]111\027\\")
    end
  end,
})

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "bashls",
  },
})

lspconfig["clangd"].setup({
  offsetEncoding = { "utf-16" },
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })
  end,
})

require("diffview").setup({
  file_panel = {
    win_config = {
      position = "right",
    },
  },
})

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--follow", -- Follow symbolic links
      "--hidden", -- Search for hidden files
      "--no-heading", -- Don't group matches by each file
      "--with-filename", -- Print the file path with the matched lines
      "--line-number", -- Show line numbers
      "--column", -- Show column numbers
      "--smart-case", -- Smart case search

      -- Exclude some patterns from search
      "--glob=!**/.git/*",
      "--glob=!**/.idea/*",
      "--glob=!**/.vscode/*",
      "--glob=!**/build/*",
      "--glob=!**/dist/*",
      "--glob=!**/yarn.lock",
      "--glob=!**/package-lock.json",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true,
      live_grep = {
        additional_args = function(opts)
          return { "--hidden" }
        end,
      },
    },
  },
  extensions = {
    file_browser = {
      hidden = { file_browser = true, folder_browser = true },
    },
  },
})

local Snacks = require("snacks")
local copilot_exists = pcall(require, "copilot")

if copilot_exists then
  -- Snacks.toggle({
  --   name = "Copilot Completion",
  --   notify = false,
  --   require("copilot.command").disable(),
  -- })

  Snacks.toggle({
    name = "Copilot Completion",
    color = {
      enabled = "azure",
      disabled = "orange",
    },
    get = function()
      return not require("copilot.client").is_disabled()
    end,
    set = function(state)
      if state then
        require("copilot.command").enable()
      else
        require("copilot.command").disable()
      end
    end,
  }):map("<leader>at")

  require("copilot.command").disable()
end
