vim.api.nvim_create_user_command("GenCPP", function()
  require("gen_cpp").generate()
end, {})
