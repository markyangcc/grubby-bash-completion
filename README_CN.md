# grubby-bash-completion

`grubby` 命令的 **Bash 自动补全脚本**

`grubby` 工具有许多选项，用于管理启动项。不过在日常使用中，常用的只是其中一部分。本补全脚本主要聚焦在 **切换内核** 和 **管理内核参数** 相关的命令上。

## 安装
将补全脚本复制到 bash-completion 目录并加载：
```bash
cp grubby-completion.bash /usr/share/bash-completion/completions/grubby

source /usr/share/bash-completion/completions/grubby
```

验证补全是否生效,
```bash
grubby --<TAB>
```

## Zsh 支持
This script can also be used in zsh through `bashcompinit`.
Add the following to your `~/.zshrc`,
```zsh
# Enable Zsh's completion system
autoload -Uz compinit && compinit

# Enable Bash completion compatibility
autoload bashcompinit && bashcompinit

# Source grubby Bash completion script
source /usr/share/bash-completion/completions/grubby
```

## 支持的命令

```bash
grubby --default-kernel
grubby --default-index
grubby --default-title

grubby --info ALL | DEFAULT | [KERNEL]

grubby --make-default
grubby --set-default=[KERNEL]
grubby --set-default-index=[KERNEL-ENTRY-INDEX]

grubby --update-kernel=[KERNEL] --args=[ARGS-TO-ADD]
grubby --update-kernel=[KERNEL] --remove-args=[ARGS-TO-REMOVE]
```
