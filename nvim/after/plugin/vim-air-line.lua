vim.g['airline#extensions#branch#enabled'] = 1
vim.g['airline#extensions#ale#enabled'] = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tagbar#enabled'] = 1
vim.g['airline_skip_empty_sections'] = 1

if vim.g.airline_powerline_fonts ~= nil then
    vim.g['airline#extensions#tabline#left_sep']     = ' '
    vim.g['airline#extensions#tabline#left_alt_sep'] = '|'
    vim.g['airline_left_sep']                        = '▶'
    vim.g['airline_left_alt_sep']                    = '»'
    vim.g['airline_right_sep']                       = '◀'
    vim.g['airline_right_alt_sep']                   = '«'
    -- vim.g['airline#extensions#branch#prefix']     = '⤴' "➔, ➥, ⎇
    vim.g['airline#extensions#readonly#symbol']      = '⊘'
    vim.g['airline#extensions#linecolumn#prefix']    = '¶'
    vim.g['airline#extensions#paste#symbol']         = 'ρ'
    vim.g['airline_symbols.linenr']                  = '␊'
    vim.g['airline_symbols.branch']                  = '⎇'
    vim.g['airline_symbols.paste']                   = 'ρ'
    vim.g['airline_symbols.paste']                   = 'Þ'
    vim.g['airline_symbols.paste']                   = '∥'
    vim.g['airline_symbols.whitespace']              = 'Ξ'
else
    vim.g['airline#extensions#tabline#left_sep'] = ''
    vim.g['airline#extensions#tabline#left_alt_sep'] = ''
    vim.g['airline_left_sep'] = ''
    vim.g['airline_left_alt_sep'] = ''
    vim.g['airline_right_sep'] = ''
    vim.g['airline_right_alt_sep'] = ''
    vim.g['airline_symbols.branch'] = ''
    vim.g['airline_symbols.readonly'] = ''
    vim.g['airline_symbols.linenr'] = ''
end