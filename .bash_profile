for file in ~/.{bashrc_git,bash_prompt,exports,bash_aliases,bash_functions,bashrc_svn,bash_globals}; do 
    [ -r "$file" ] && source "$file" 
done
unset file
