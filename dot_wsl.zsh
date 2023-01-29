export WINHOME=$(wslpath "$(wslvar USERPROFILE)")
alias -g w='cd $WINHOME'
alias -g cl='clear'
cdw() {
    local d=`wslpath "$1"`; cd "$d";
}
