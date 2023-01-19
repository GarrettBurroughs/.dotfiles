selected=`printf ".zshrc\n.zshlocal" | fzf`
echo $selected
nvim ~/$selected

