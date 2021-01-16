### Customização do prompt de comando do shell Bash
### Eduardo Rolim

## Alias para um comando mais humanizado de uso do shell

alias please="sudo"

## Carrega o arquivo git-prompt.sh baixado do repositório:
## https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="verbose"

# retorna emoji com código de erro, ou emoji aleatório
EMOJIS=(😺 😸 🙀 🥳 🥶 🥵 👾 🤖 🎃 🤯 🤟 🤙 💅 👏 👍 🐞 🐧 🥇 🚀 💖 🌈 🎮 🐳 🐍 🐘 🐈 🦄 🐬 💣)

function ultimo_ret() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "🤬$RETVAL " || echo "${EMOJIS[$RANDOM % ${#EMOJIS[@]}]} "
}

C_R="\[\e[m\]"		#Reset de Cor
C_1="\[\e[01;31m\]"	#Vermelho Vivo
C_2="\[\e[33m\]"	#Amarelo
C_3="\[\e[32m\]"	#Verde
C_4="\[\e[36m\]"	#Ciano
C_5="\[\e[01;35m\]"	#Roxo

PS1_TTL="\[\e]0;\u@\h:\w\a\]"
PS1_RET="$C_1\`ultimo_ret\`$C_R"
PS1_TIME="$C_2\t$C_R"
PS1_USR_HST="$C_3\u@\h$C_R"
PS1_PWD="$C_4\w$C_R"
PS1_DVCS="$C_5\`__git_ps1 \" (%s)\"\`$C_R"

## Usando \`cmd\` no lugar de $(cmd) pois com o último o comando só carrega durante o source do .bashrc
export PS1="\n[$PS1_TTL$PS1_RET$PS1_TIME $PS1_USR_HST:$PS1_PWD$PS1_DVCS]\n\\$ "
