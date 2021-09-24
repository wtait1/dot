# config sync / backup

## get started on a new machine

```sh
git clone --recurse-submodules git@github.com:wtait1/dot.git ~/.dotfiles
cd ~/.dotfiles && ./install
```

## scripts

| script name    | function                                                               |
|----------------|------------------------------------------------------------------------|
| `backup.sh`    | copy system configs into files in this repo                            |
| `sync.sh`      | run `backup.sh` AND git commit + push to Github to persist new changes |
| `auto_sync.sh` | create a crontab entry to run `sync.sh` on a schedule                  |