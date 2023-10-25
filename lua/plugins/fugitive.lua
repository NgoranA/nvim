return {
  "tpope/vim-fugitive",
  init = function()
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitFugitiveLazyLoad", { clear = true }),
      callback = function()
        vim.fn.system("git status " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
        if vim.v.shell_error == 0 then
          vim.api.nvim_del_augroup_by_name("GitFugitiveLazyLoad")
          vim.schedule(function()
            require("lazy").load({ plugins = { "vim-fugitive" } })
          end)
        end
      end,
    })
  end,
  cmd = { "Git" },
  config = function()
    local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = Fugitive,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>GP", function()
          vim.cmd.Git("push")
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>PR", function()
          vim.cmd.Git({ "pull", "--rebase" })
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>to", ":Git push -u origin ", opts)
      end,
    })
  end,
}
