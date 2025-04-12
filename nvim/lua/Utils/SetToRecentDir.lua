local M = {}

function M.open()
  local telescope = require("telescope.builtin")

  telescope.oldfiles({
    attach_mappings = function(_, map)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      map("i", "<CR>", function(prompt_bufnr)
        local entry = action_state.get_selected_entry()
        local filepath = entry and entry.value
        actions.close(prompt_bufnr)

        if filepath then
          -- Open the file
          vim.cmd("edit " .. vim.fn.fnameescape(filepath))

          -- Set Neo-tree root to file's directory
          local dir = vim.fn.fnamemodify(filepath, ":h")
          vim.cmd("Neotree dir=" .. vim.fn.fnameescape(dir))
        end
      end)

      return true
    end,
  })
end

return M

