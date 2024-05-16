return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress", "nvim-lua/lsp-status.nvim" },
  config = function()
    local lsp_info = function()
      local bufnr = vim.fn.bufnr()
      local text = ""

      for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
        if text == "" then
          text = client.name
        else
          text = text .. ", " .. client.name
        end
      end

      return text
    end
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- ... the rest of your lualine config
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = {
          "diagnostics",
          "filetype",
          function()
            return "(" .. vim.fn.bufnr() .. ")"
          end,
        },
        lualine_y = { "location", "progress" },
        lualine_z = {
          lsp_info,
        },
      },
    })
  end,
}
