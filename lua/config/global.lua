-- Default globals for the game.
local g = vim.g

vim.g.go_def_mapping_enabled = 0


-- Go syntax highlighting
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_space_tab_error = 1
vim.g.go_highlight_trailing_whitespace_error = 1
vim.g.go_highlight_trailing_whitespace = 1
vim.g.go_highlight_array_whitespace_error = 1
vim.g.go_highlight_chan_whitespace_error = 1
vim.g.go_highlight_comment_spacing = 1
vim.g.go_highlight_operators = 1

vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = "goimports"

vim.g.go_auto_type_info = 1

-- Airline
-- vim.g.airline_powerline_fonts = 1
-- vim.g.airline#extensions#tabline#enabled = 1
-- vim.g.airline#extensions#tabline#left_sep = ' '
-- vim.g.airline_extensions = []

-- Enable Copilot for the gitcommit, markdown and yaml filetypes
-- vim.g.copilot_filetypes = {'gitcommit', 'markdown', 'yaml'}
-- vim.g.copilot_filetypes = {gitcommit = false, markdown = false, xml = false, yaml = false, json = false}
--

-- g.vimspector_enable_mappings = 'VISUAL_STUDIO'
-- g.copilot_assume_mapped = true
-- g.copilot_not_tab_map = true
-- vim.api.nvim_set_keymap("i", "<c-j>", ':copilot#Accept("<CR>")', { silent = true, expr = true })
