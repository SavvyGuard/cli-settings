"Set tabs to 4 spaces"                                                                                                                                   
set tabstop=4                                                                                                                                            
set shiftwidth=4                                                                                                                                         
set expandtab                                                                                                                                            
set cindent                                                                                                                                              
                                                                                                                                                         
"Highlight search results"                                                                                                                               
set hlsearch                                                                                                                                             
                                                                                                                                                         
"Remember last position"                                                                                                                                 
if has("autocmd")                                                                                                                                        
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                                                           
  endif                                                                                                                                                  
                                                                                                                                                         
"Turn on syntax highlighting"                                                                                                                            
syntax on                                                                                                                                                
set clipboard=unnamedplus                                                                                                                                
                                                                                                                                                         
"Use inkpot color scheme"                                                                                                                                
colorscheme inkpot                                                                                                                                       
                                                                                                                                                         
match Todo /\s\+$/             

"Auto add comment line after a comment"
:set fo+=r
