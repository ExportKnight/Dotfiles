local M = {}

function M.pick()
  local telescope = require("telescope.builtin")
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values
  local Path = require("plenary.path")

  local base_dir = vim.fn.expand("~/Documents/Coding-Projects")

  pickers.new({}, {
    prompt_title = "Select Folder",
    finder = finders.new_oneshot_job({
      "fd", ".", "--type", "d", "--max-depth", "1"
    }, {
      cwd = base_dir,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection and selection.value then
          local full_path = Path:new(base_dir, selection.value):absolute()
          vim.cmd("Neotree dir=" .. vim.fn.fnameescape(full_path))
        end
      end)

      return true
    end,
  }):find()
end

return M

