let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
autocmd FileType java nmap <leader>dd :CocCommand java.debug.vimspector.start<CR>
nmap <leader>ds :call vimspector#WriteSessionFile(".vim/debuggingsession.txt")<CR>
nmap <leader>dl :call vimspector#ReadSessionFile(".vim/debuggingsession.txt")<CR>
nmap gs :<C-u>VimspectorShowOutput Console<CR> i-exec step<CR><Esc>
nmap gn :<C-u>VimspectorShowOutput Console<CR> i-exec next<CR><Esc>
nmap go :<C-u>VimspectorShowOutput Console<CR> i-exec finish<CR><Esc>
