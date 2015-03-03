#!/bin/bash
output=steroids-completion
steroidsurl="https://raw.githubusercontent.com/AppGyver/steroids/master/src/steroids.coffee"
OPTS=$(curl -s $steroidsurl | grep '^\s\+when ".*"$' | sed -e 's/when //' -e 's/[ "]//g' | tr '\n' ' ' )
cat > $output <<TEMPLATE
# skeleton bash completion for steroids
# steroids? https://github.com/AppGyver/steroids 
_steroids() {
	local cur prev opts
	COMPREPLY=()
	cur="\${COMP_WORDS[COMP_CWORD]}"
	prev="\${COMP_WORDS[COMP_CWORD-1]}"
	opts="$OPTS"
	case "\${prev}" in
		steroids)
			COMPREPLY=( \$(compgen -W "\${opts}" -- \${cur}) )
			return 0
			;;
		*)
			COMPREPLY=( \$(compgen -o default \${cur}) )
			return 0
			;;
	esac
}
complete -F _steroids steroids
TEMPLATE
chmod +x $output