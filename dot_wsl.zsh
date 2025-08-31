export WINHOME=$(wslpath "$(cmd.exe /C 'echo %USERPROFILE%' 2>/dev/null | tr -d '\r')")
alias -g w='cd $WINHOME'
alias -g cl='clear'
cdw() {
    local d=`wslpath "$1"`; cd "$d";
}
