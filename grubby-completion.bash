_grubby() {
    local cur prev
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local commands="--default-kernel --default-index --default-title --info --make-default \
                    --set-default --set-default-index --update-kernel --args --remove-args"

    _kernels() { ls /boot/vmlinuz-* 2>/dev/null; }
    _entries() {
        local num=$(ls -t /boot/loader/entries/ 2>/dev/null | wc -l)
        [ "$num" -gt 0 ] && seq 0 $((num-1))
    }

    case "$prev" in
        grubby)
            COMPREPLY=( $(compgen -W "$commands" -- "$cur") )
            ;;
        --info)
            COMPREPLY=( $(compgen -W "ALL DEFAULT $(_kernels)" -- "$cur") )
            ;;
        --set-default|--update-kernel)
            COMPREPLY=( $(compgen -W "$(_kernels)" -- "$cur") )
            ;;
        --set-default-index)
            COMPREPLY=( $(compgen -W "$(_entries)" -- "$cur") )
            ;;
        --args|--remove-args)
            COMPREPLY=()
            ;;
    esac
}

complete -F _grubby grubby
