# Dotfiles
Makes use of the [bare git repo method](https://www.atlassian.com/git/tutorials/dotfiles). It uses `config` instead of `git` by adding this line to the bashrc/zshrc file:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Besides that it uses the standard `git` command arguments, like `add`, `commit`, and `push`.

For a cleaned up `config status` use this command:

```bash
config config --local status.showUntrackedFiles no
```

## Gitleaks
For a little more security I have installed a [gitleaks](https://github.com/gitleaks/gitleaks) hook, based on how [gitlabs](https://gitlab.com/gitlab-com/gl-security/security-research/gitleaks-endpoint-installer) does it. The script for the hook is in this repo.

The hook is initialized with this command:

```bash
config config --local core.hooksPath $HOME/.cfg/hooks
```
