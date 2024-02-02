# Dotfiles

Maakt gebruik van de [bare git repo methode](https://www.atlassian.com/git/tutorials/dotfiles). Het maakt gebruik van ```config``` in plaats van ```git``` door deze lijn aan het bashrc/zshrc-bestand toe te voegen:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Verder gebruikt het gewoon de standaard ```git``` commando's zoals ```add```, ```commit``` en ```push```.

Voor een opgeruimde ```config status``` gebruik je dit commando:

```bash
config config --local status.showUntrackedFiles no
```

## Gitleaks

Voor een beetje meer veiligheid heb ik een gitleaks hook geinstalleerd, gebaseerd op hoe [gitlabs](https://gitlab.com/gitlab-com/gl-security/security-research/gitleaks-endpoint-installer) het doet. Het script voor de hook staat in de repo.

De hook wordt geinitieerd met dit commando:

```bash
config config --local core.hooksPath $HOME/.cfg/hooks
```
