# grubby-bash-completion
bash-completion for grubby command

grubby 命令提供了许多子命令，其中大部分用于管理启动项。在大多数情况下，我们并不需要使用它。所以，也没做补全。
这些命令聚焦于使用 grubby 切换内核以及添加修改内核参数。

## 支持情况
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
