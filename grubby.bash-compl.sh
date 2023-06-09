_grubby() {
	local cur prev commands
	commands="--default-kernel --default-index --default-title --info --make-default --set-default --set-default-index --update-kernel --args --remove-args"

	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD - 1]}"

	case "${prev}" in
	grubby)
		COMPREPLY=($(compgen -W "${commands}" -- ${cur}))
		return 0
		;;
	--info)
		kernels=$(ls /boot/vmlinuz-*)
		COMPREPLY=($(compgen -W "ALL DEFAULT $kernels" -- ${cur}))
		return 0
		;;
	--set-default)
		kernels=$(ls /boot/vmlinuz-*)
		COMPREPLY=($(compgen -W "$kernels" -- ${cur}))
		return 0
		;;
	--set-default-index)
		numkernels=$(ls -t /boot/loader/entries/ | wc -l)
		maxindex=$((numkernels - 1))
		indexes=$(echo $(seq 0 $maxindex))
		COMPREPLY=($(compgen -W "$indexes" -- ${cur}))
		return 0
		;;
	--update-kernel)
		kernels=$(ls /boot/vmlinuz-*)
		COMPREPLY=($(compgen -W "$kernels" -- ${cur}))
		return 0
		;;
	--args | --remove-args)
		COMPREPLY=($(compgen -W "" -- ${cur}))
		return 0
		;;
	*) ;;
	esac
}
complete -F _grubby grubby
