# Dotfiles

Maakt gebruik van de [bare git repo methode](https://www.atlassian.com/git/tutorials/dotfiles). Het maakt gebruik van ```config``` in plaats van ```git``` door deze lijn aan het bashrc/zshrc-bestand toe te voegen:

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Verder gebruikt het gewoon de standaard ```git``` commando's zoals ```add```, ```commit``` en ```push```.
