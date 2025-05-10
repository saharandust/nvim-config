if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- add more things to the ensure_installed table protecting against community packs modifying it
    ensure_installed = {
      "lua",
      "vim",
      "bash",
      "css",
      "html",
      "http",
      "go",
      "gotmpl",
      "templ",
      "make",
      "markdown",
      "markdown_inline",
      "query",
      "javascript",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
