autoload -U compinit
compinit

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt append_history

# 色を使う
setopt prompt_subst

# set prompt
case ${UID} in
0)
    PROMPT="%B%{[31m%}%/#%{[m%}%b "
    PROMPT2="%B%{[31m%}%_#%{[m%}%b "
    SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="%{[31m%}%/%%%{[m%} "
    PROMPT2="%{[31m%}%_%%%{[m%} "
    SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
    ;;
esac


# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

#補完で大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# alias
alias emacs="emacs -nw"
alias preview="/Applications/Preview.app/Contents/MacOS/Preview"
alias math="/Applications/Mathematica.app/Contents/MacOS/MathKernel"

export PATH=~/bin:$PATH
export PATH=/Applications/pTeX.app/teTeX/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH

# VCSの情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info

# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"
