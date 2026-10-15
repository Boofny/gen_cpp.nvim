# TODO

> Structure: 
> single command with user input for a base name for an hpp file and cpp file 
> after files are generated files are auto linked for later use
> in order for this command to work the pwd in neovim has to have a path of /include and /src
> I think it's best not to search for the file using git or anything like that just have 
> if !(path_inlcude or path_src) then send error to make sure user is in the home dir of there cpp project 
> also thie plugin should only be working when inside of a cpp file like how lazydev works with lua
> thinking of also using a plugin like nui for better ui rather than just vim.ui.input as a default

- [x] 1. start making the command with user input
- [ ] 2. update the path for include to have a namespace like "Proj_name/tool.hpp"

