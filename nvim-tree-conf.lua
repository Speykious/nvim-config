local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  open_on_tab = true,
  view = {
    width = 30,
    side = 'left',
    adaptive_size = false,
    mappings = {
      custom_only = false,
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
        { key = {"<2-RightMouse>", "C"},        action = "cd" },
        { key = "<M-v>",                        action = "vsplit" },
        { key = "<M-x>",                        action = "split" },
        { key = "t",                            action = "tabnew" },
        { key = "<",                            action = "prev_sibling" },
        { key = ">",                            action = "next_sibling" },
        { key = "P",                            action = "parent_node" },
        { key = "<BS>",                         action = "close_node" },
        { key = "<S-CR>",                       action = "close_node" },
        { key = "<C-Space>",                    action = "preview" },
        { key = "K",                            action = "first_sibling" },
        { key = "J",                            action = "last_sibling" },
        { key = "I",                            action = "toggle_ignored" },
        { key = "H",                            action = "toggle_dotfiles" },
        { key = "R",                            action = "refresh" },
        { key = "a",                            action = "create" },
        { key = "d",                            action = "remove" },
        { key = "r",                            action = "rename" },
        { key = "<C-r>",                        action = "full_rename" },
        { key = "x",                            action = "cut" },
        { key = "c",                            action = "copy" },
        { key = "p",                            action = "paste" },
        { key = "y",                            action = "copy_name" },
        { key = "Y",                            action = "copy_path" },
        { key = "gy",                           action = "copy_absolute_path" },
        { key = "{",                            action = "prev_git_item" },
        { key = "}",                            action = "next_git_item" },
        { key = "-",                            action = "dir_up" },
        { key = "s",                            action = "system_open" },
        { key = "q",                            action = "close" },
        { key = "g?",                           action = "toggle_help" },
      }
    }
  }
}

local tree_enabled = false
function _G.tree_toggle()
  if tree_enabled then
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
  else
    require'bufferline.state'.set_offset(30, 'FileTree')
    require'nvim-tree'.find_file(true)
  end
  tree_enabled = not tree_enabled
end
