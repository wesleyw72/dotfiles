local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ls', builtin.buffers, {})
vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

require('telescope').setup {
  extensions = {
    file_browser = {
        -- use the "ivy" theme if you want
        theme = "ivy",
    }
  }
}
require("telescope").load_extension "file_browser"

local telescope_extensions = require("telescope").extensions
vim.keymap.set({ "n" }, "<leader>fb", function()
  telescope_extensions.file_browser.file_browser()
end, NOREMAP_SILENT)

vim.keymap.set({ "n" }, "<leader>ch", function()
  builtin.command_history()
end, NOREMAP_SILENT)

vim.keymap.set({ "n" }, "<leader>sh", function()
  builtin.search_history()
end, NOREMAP_SILENT)

local project_files = function()
  local ok_git_files = pcall(
    builtin.git_files,
    { show_untracked = true }
  )
  if not ok_git_files then
    builtin.find_files({})
  end
end

vim.keymap.set({ "n" }, "<leader>fp", function()
  project_files()
end, NOREMAP_SILENT)
