# ~/.bash_profile: executed by the command interpreter for login shells.

# Because of this file's existence, neither ~/.bash_login nor ~/.profile
# will be sourced.

# See /usr/share/doc/bash/examples/startup-files for examples.
# The files are located in the bash-doc package.

# Because ~/.profile isn't invoked if this files exists,
# we must source ~/.profile to get its settings:
if [ -r ~/.profile ]; then . ~/.profile; fi

# The following sources ~/.bashrc in the interactive login case,
# because .bashrc isn't sourced for interactive login shells:
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

# I'm still trying to wrap my head about what to put here.  A suggestion
# would be to put all the `bash` prompt coloring sequence functions as
# described on http://brettterpstra.com/2009/11/17/my-new-favorite-bash-prompt/