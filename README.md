# Linux

Setup using the ansible playbook.

```bash
sudo apt install ansible
ansible-playbook --ask-become-pass setup.yml
```

### Config management

Use the [bare Git repo method](https://www.atlassian.com/git/tutorials/dotfiles). It uses ```config``` instead of ```git``` as commands by adding this line to zshrc:

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Other than that it uses the standard ```git``` commands such as ```add```, ```commit``` and ```push```.
