# grubby-bash-completion
bash-completion for grubby command

grubby provides many sub commands, most of them is to manager boot entry.
Most of time, we don't need it in most cases.

## support commands
```bash
grubby --default-kernel
grubby --default-index
grubby --default-title

grubby --info ALL
grubby --info DEFAULT

grubby --make-default
grubby --set-default=kernel-path
grubby --set-default-index=entry-index

grubby --update-kernel=kernel-path --args=args
grubby --update-kernel=kernel-path --remove-args=args
```