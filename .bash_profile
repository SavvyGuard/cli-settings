for file in ~/.{bashrc_git,bash_prompt,exports,bash_aliases,bash_functions,bashrc_svn}; do 
    [ -r "$file" ] && source "$file" 
done
unset file
