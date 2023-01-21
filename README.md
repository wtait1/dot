# config sync / backup

dev environment bootstrapping powered by [dotbot](https://github.com/anishathalye/dotbot)

## get started on a new machine

```sh
curl https://raw.githubusercontent.com/wtait1/dot/main/git_init.sh | bash
git clone --recurse-submodules git@github-personal.com:wtait1/dot.git ~/.dotfiles
cd ~/.dotfiles && ./install
```

### SSH config

I have 2 different Github accounts (dedicated work, dedicated personal) so I need the following SSH config

```sh
# personal Github account
Host github-personal.com
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile /Users/<user>/.ssh/personal-github/<private-key>
  # needed to not use default work account set globally in ~/.gitconfig
  # https://stackoverflow.com/a/7927828/17696738
  IdentitiesOnly yes

# work account on github.com
# replace w/ Github Enterprise host here if needed
Host github.com
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile /Users/<user>/.ssh/work-github/<private-key>
  IdentitiesOnly yes
```

## scripts

| script name    | function                                              |
|----------------|-------------------------------------------------------|
| `git_init.sh`  | simplify SSH configuration (keys, host config, etc.)  |
| `backup.sh`    | copy system configs into files in this repo           |
| `sync.sh`      | run `backup.sh` + git commit                          |
| `auto_sync.sh` | create a crontab entry to run `sync.sh` on a schedule |
