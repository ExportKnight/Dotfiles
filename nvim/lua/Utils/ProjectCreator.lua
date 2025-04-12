local M = {}

function M.prompt_new_folder()
  vim.ui.input({ prompt = "New folder name: " }, function(input)
    if input and #input > 0 then
      local base_path = vim.fn.expand("~/Documents/Coding-Projects")
      local new_folder_path = base_path .. "/" .. input

      -- Create the folder
      vim.fn.mkdir(new_folder_path, "p")

      -- Open Neo-tree rooted at the new folder
      vim.cmd("Neotree dir=" .. vim.fn.fnameescape(new_folder_path))
    end
  end)
end

return M

