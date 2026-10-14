local M = {}

function M.generate()
  local opts = {prompt = 'Enter file name: ', scope = 'buffer '}
  local file_name;
  vim.ui.input(opts, function (input)
    file_name = input
  end)

  local cwd = vim.fn.getcwd()
  local src_path = cwd .. "/src"
  local include_path = cwd .. "/include"

  if vim.fn.isdirectory(src_path) == 0 or vim.fn.isdirectory(include_path) == 0 then
    vim.notify("Not in cwd change cwd to proper paths", vim.log.levels.ERROR)
    return
  end

  local cpp_file = file_name .. ".cpp"
  local hpp_file = file_name .. ".hpp"

  local cpp_file_path = src_path .. "/" .. cpp_file
  local hpp_file_path = include_path .. "/" .. hpp_file

  local create_cpp = io.open(cpp_file_path, "w")
  local create_hpp = io.open(hpp_file_path, "w")

  if create_cpp then
    create_cpp:write("#include <"..hpp_file..">\n#include <iostream>\n\nvoid "..file_name.."_greet(){\n std::cout << " .. "\"" .. "hello from " .. hpp_file .. "\"".. "<< std::endl;\n}")
    create_cpp:close()
    vim.notify("\n"..cpp_file .. " has been created", vim.log.levels.INFO)
  else
    vim.notify("Error creating cpp file", vim.log.levels.ERROR)
    return
  end

  if create_hpp then
    create_hpp:write("#pragma once\n\nvoid " .. file_name .. "_greet(); ")
    create_hpp:close()
    vim.notify(hpp_file .. " has been created", vim.log.levels.INFO)
  else
    vim.notify("Error creating hpp file", vim.log.levels.ERROR)
    return
  end
end

return M
