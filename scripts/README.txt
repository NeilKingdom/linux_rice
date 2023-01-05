!!!Important!!!

All directories on this level (with the exception of res) are managed by stow.

Each directory is a stow "package". $HOME/scripts is the stow directory.

Each package is symlinked to the target directory /usr/local/bin. This is where
the scripts are actually ran from.

Doing it this way means that we don't need to add a bunch of subdirectories to
our $PATH to run our scripts.

Even though the symlinks are hard links, meaning that changes in $HOME/scripts
will be reflected in /usr/loca/bin, it's still good practice to occassionally
restow packages e.g. sudo stow -R <package> -t /usr/local/bin.

On another note, for managing resources that are related to my scripts (but are
separate from the scripts themselves) I source a file in $HOME/scripts/res called
loadres which exports the absolute path to the resources directory and the name of
the resource subdirectory (which must match the name of the script being ran).

In order to use loadres, I source it at the beginning of all my scripts that require
it.
