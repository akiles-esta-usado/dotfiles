require("mytelescope.setup")
require("mytelescope.mappings")


local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "~/.config/nvim",
    })
end

return M
