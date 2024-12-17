set nu
augroup relative_numbser
 autocmd!
 autocmd InsertEnter * :set norelativenumber
 autocmd InsertLeave * :set relativenumber
augroup END

set tabstop=4
set wildmenu
let mapleader=";"
map K 10k
map J 10j
map H 10h
map L 10l

map <leader>n :NERDTree<cr>

nmap W :w<cr>
nmap Q :q<cr>
nmap <leader>t :bel terminal<cr>

nnoremap <leader>v <c-w>v
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
"vim插件
call plug#begin()
Plug 'connorholyday/vim-snazzy'

Plug 'skywind3000/vim-terminal-help'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'

Plug 'preservim/nerdtree'

Plug 'mhinz/vim-startify'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }

call plug#end()

color snazzy

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.cpp,.sh,.py文件，自动插入文件头 
" 自动命令，针对特定文件类型的新文件执行 SetTitle 函数
autocmd BufNewFile *.cpp,*.c exec ":call SetTitle()"

" 定义函数SetTitle，自动插入文件头和特定文件类型的内容
function! SetTitle()
    " 添加通用的文件头信息
    call append(0, [
                \ "/*#########################################################################",
                \ "# File Name: ".expand("%"),
                \ "# Author: sakuzeng",
                \ "# mail: sakuzeng@foxmail.com",
                \ "# Created Time: ".strftime("%c"),
                \ "#########################################################################*/"
                \ ])

    " 根据不同的文件类型添加特定的开头
	if &filetype == 'cpp'
        call append(line("$"), ['#include <iostream>', 'using namespace std;', '', 'int main() {', '    return 0;', '}'])
	elseif &filetype == 'c'
        call append(line("$"), ['#include <stdio.h>', '', 'int main() {', '    return 0;', '}'])
	endif
   " 移动光标到文件末尾之后的第一行，以便开始编写代码
    normal G$
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.sh,*.py exec ":call SetPyTitle()" 
func SetPyTitle() 
	" 添加通用的文件头信息
    call append(0, [
                \ "#########################################################################",
                \ "# File Name: ".expand("%"),
                \ "# Author: sakuzeng",
                \ "# mail: sakuzeng@foxmail.com",
                \ "# Created Time: ".strftime("%c"),
                \ "#########################################################################"
                \ ])
   normal G$
endfunc 


