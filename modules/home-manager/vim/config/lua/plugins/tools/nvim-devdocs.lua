return {
  -- "luckasRanarison/nvim-devdocs",
  dir = "~/Projects/nvim-devdocs",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "DevdocsFetch",
    "DevdocsInstall",
    "DevdocsUninstall",
    "DevdocsOpen",
    "DevdocsOpenFloat",
    "DevdocsOpenCurrent",
    "DevdocsOpenCurrentFloat",
    "DevdocsUpdate",
    "DevdocsUpdateAll",
    "DevdocsBuild",
  },
  opts = {
    format = "markdown",
    filetypes = {
      javascript = { "html", "javascript" },
    },
    -- use_node = false,
    ensure_installed = {
      -- "git",
      -- "bash",
      -- "rust",
      -- "lua-5.4",
      -- "html",
      -- "css",
      -- "javascript",
      -- "typescript",
      -- "react",
      -- "web_extensions",
    },
    wrap = true,
    previewer_cmd = "glow",
    cmd_args = { "-s", "auto", "-w", "97" },
    cmd_ignore = {},
    picker_cmd = true,
    picker_cmd_args = { "-s", "auto", "-w", "45" },
    mappings = {
      open_in_browser = "<leader>vb",
      toggle_rendering = "<leader>vr",
    },
    log_level = "debug",
  },
}
