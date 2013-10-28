# smashwilson's dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine, forked from
@holman's.

Now that I work at Rackspace, I'm spending more time spinning up and tearing
down these little scratch servers, and nothing makes me sad like a plain bash
prompt with no colors or git zazz, or a completely vanilla vim that does
indentation all wrong.

Traditionally I haven't done a _ton_ of customizations, but maybe now that I've
got a place to stash them, that'll change!

I forked @holman's because I like the level of organization he's got, and because
there were some nifty tricks in there that'll be useful. I don't use zsh or a
Mac at the moment, but the basics mechanics of installation and the path munging
are all here, so why re-invent the wheel?

## install

Run this:

```sh
git clone https://github.com/smashwilson/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

`dot` is a simple script that installs some dependencies, sets sane OS X
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.bash` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what's inside

Less stuff than the original :grinning: Have a look
[upstream](https://github.com/holman/dotfiles) for the full, unabridged
smorgasboard.

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

## bugs

Like @holman, I want this to work for everyone; that means when you clone it
down it should work for you even though you may not have `rbenv` installed,
for example. That said, I do use this as *my* dotfiles, so there's a good chance
I may break something if I forget to make a check for a dependency. [Toss me
an issue](https://github.com/smashwilson/dotfiles/issues) if you're using this
and I busted your setup, and I'll see what I can do.

## thanks

_Because thanks obeys the transitive property:_

I forked [Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll my own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
