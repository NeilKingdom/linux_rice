✝️ These scripts were written in the name of the __Father__ and of the __Son__ and of the __Holy Spirit__; Amen.

# Directory Structure

- All script directories (except for res) are managed by stow.
- Each directory is referred to by stow as a _package_. The parent directory (scripts) is the _stow
directory_.
- Each package is symlinked to the _target directory_ (/usr/local/bin).
- /usr/local/bin should already be present in your $PATH environment variable, meaning that the symlinks should
be executable by default.

# Usage

Even though the symlinks are hard links, (meaning that changes in the stow directory will be reflected in
the target directory), it's still good practice to occasionally restow packages e.g.

```console
sudo stow -R <package> -t <tgt_dir>
```
