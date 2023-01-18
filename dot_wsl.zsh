alias -g w='cd /mnt/c/Users/oguzhanergin'
alias -g cl='clear'
cdw() {
    local d=`wslpath "$1"`; cd "$d";
}
