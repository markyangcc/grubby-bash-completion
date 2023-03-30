_grubby() {
    local cur prev commands
    commands="--default-kernel --default-index --default-title --info --make-default --set-default --set-default-index --update-kernel"

    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    case "${prev}" in
    grubby)
        COMPREPLY=($(compgen -W "${commands}" -- ${cur}))
        return 0
        ;;
    --default-kernel)
        COMPREPLY=($(compgen -W "$(grubby --info ALL | grep kernel | awk '{print $2}')" -- ${cur}))
        return 0
        ;;
    --default-index)
        COMPREPLY=($(compgen -W "$(grubby --info ALL | grep index | awk '{print $2}')" -- ${cur}))
        return 0
        ;;
    --default-title)
        COMPREPLY=($(compgen -W "$(grubby --info ALL | grep index | awk '{print $2}')" -- ${cur}))
        return 0
        ;;
    --info)
        COMPREPLY=($(compgen -W "ALL DEFAULT" -- ${cur}))
        return 0
        ;;
    --set-default=*)
        COMPREPLY=($(compgen -W "$(grubby --info ALL | grep kernel | awk '{print $2}')" -- ${cur}))
        return 0
        ;;
    --set-default-index=*)
        COMPREPLY=($(compgen -W "$(grubby --info ALL | grep index | awk '{print $2}')" -- ${cur}))
        return 0
        ;;
    --update-kernel=*)
        COMPREPLY=($(compgen -f ${cur}))
        return 0
        ;;
    --args | --remove-args)
        COMPREPLY=($(compgen -W "ro rw quiet splash vga=normal" -- ${cur}))
        return 0
        ;;
    *) ;;
    esac
}
complete -F _grubby grubby
