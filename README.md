# smashwilson's dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

Now that I work at Rackspace, I'm spending more time spinning up and tearing
down these little scratch servers, and nothing makes me sad like a plain bash
prompt with no colors or git zazz, or a completely vanilla vim that does
indentation all wrong.

## install

Run this:

```sh
git clone https://github.com/smashwilson/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory,
install Ansible, and run a playbook that sets up some most-used tooling.
Everything is configured and tweaked within `~/.dotfiles`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.bash**: Any files ending in `.bash` get loaded into your
  environment.
- **topic/path.bash**: Any file named `path.bash` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.bash**: Any file named `completion.bash` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## thanks

_Because thanks obeys the transitive property:_

This started as a fork of [@holman's](https://github.com/holman/dotfiles)
dotfiles. I've kept the structure, but changed everything *back* to `bash`
from `zsh`, and switched to using Ansible for the installation because
Ansible is rad.

Holman forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of his changes and tweaks inspired him to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
