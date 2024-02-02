# Dotfiles

Maakt gebruik van de [bare git repo methode](https://www.atlassian.com/git/tutorials/dotfiles). Het maakt gebruik van ```config``` in plaats van ```git``` door deze lijn aan het bashrc/zshrc-bestand toe te voegen:

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Verder gebruikt het gewoon de standaard ```git``` commando's zoals ```add```, ```commit``` en ```push```.

## Gitleaks

Voor een beetje meer veiligheid heb ik een gitleaks hook geinstalleerd, gebaseerd op hoe [gitlabs](https://gitlab.com/gitlab-com/gl-security/security-research/gitleaks-endpoint-installer) het doet.

In ```.cfg/hooks``` staat een uitvoerbaar script genaamd ```pre-commit``` met deze inhoud:

```bash
#!/bin/bash

if [[ -n $I_WANT_GITLEAKS_SKIP ]]
  then
  exit 0
fi

MSG="\n\n\033[31mCommit failed.\n\n\033[0mgitleaks has detected some secrets in your commit."
/usr/local/bin/gitleaks protect --staged --redact --verbose || (printf "${MSG}" ; exit -1)
```

Daarna is de hook geinitieerd met dit commando:

```bash
config config core.hooksPath $HOME/.cfg/hooks
```
