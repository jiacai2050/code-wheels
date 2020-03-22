# 别名相关配置
[ -r ~/.aliasrc ] && source ~/.aliasrc
# PATH 相关配置
[ -r ~/.pathrc ] && source ~/.pathrc
# 自己程序中的相关配置
[ -r ~/.devrc ] && source ~/.devrc

export LC_ALL=en_US.UTF-8
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
#export EDITOR="emacsclient -t -a=\"\""
# for ctrl-x e
export ALTERNATE_EDITOR=""
export LANG=en_US.UTF-8
export PS1="\n\e[1;37m[\e[m\e[1;35m\u\e[m\e[1;36m@\e[m\e[1;37m\h\e[m \e[1;33m\t\e[m \w\e[m\e[1;37m]\e[m\e[1;36m\e[m\n\${all_proxy}\$(__git_ps1)$ "

function proxy_off(){
    unset all_proxy
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}
function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,192.168.33.10,.alipay-inc.com"
    # export http_proxy="http://127.0.0.1:8118"
    export http_proxy="socks5://127.0.0.1:1080"
     export http_proxy="socks5://127.0.0.1:13659"
    export https_proxy=$http_proxy
    export all_proxy=$http_proxy
    echo -e "已开启代理"
}

function command_exists() {
    command -v "$1" &> /dev/null
}

alias ls='ls -FG'
alias ll='ls -lh'
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'
alias gc='git clone '
# alias e='emacsclient -t -a ""'
alias tailf='tail -F '

# export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
# export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup"
export PATH=$PATH:$HOME/.cargo/bin:$GOPATH/bin
if command_exists rustc; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# go
export GOPATH="$HOME/code/go"
export GO111MODULE=on
export GOPROXY="https://goproxy.cn,direct"
export GOPRIVATE=gitlab.alipay-inc.com,gitlab.alibaba-inc.com
export PATH=$PATH:$GOPATH/bin
# REPL
alias yaegi='rlwrap yaegi'
alias gobx='GOOS=linux GOARCH=amd64 go build -v '

