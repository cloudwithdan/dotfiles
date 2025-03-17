# awesome cd movements from zshkit
setopt autocd
setopt autopushd
setopt pushdminus
setopt pushdsilent
setopt pushdtohome
setopt cdablevars

DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1
