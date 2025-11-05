local M = {}

function M.setup()
    local arc = require('arc')
    local parsers = require('nvim-treesitter.parsers')

    M.arc_root = arc.root()
    M.parsers = parsers.get_parser_config()

    vim.filetype.add({
        filename = {
            ["ya.make"] = "yamake",
        }
    })

    if vim.fn.isdirectory(M.arc_root..'/devtools/ide/tree-sitter-yamake') ~=0 then
        --- @diagnostic disable: inject-field
        M.parsers.yamake = {
            install_info = {
                url = M.arc_root..'/devtools/ide/tree-sitter-yamake',
                files = {
                    "src/parser.c",
                },
            },
        }
    end
end

return M
