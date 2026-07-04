
# Behold these, mine dots!

This is the repo containing my humble dotfiles. You may find them rather paltry as opposed to others, but they are mine, and I'm happy with them (:

And if this seems a bit barebones, please take into consideration that this is really just for me and my pals, so... hey-ho! 


## Installation

```bash
git clone https://github.com/gr4b01d/dotfiles
cd dotfiles
stow [directory you wish to use] #link the directories to their proper places
git submodule Init
git submodule update --recursive
xargs pacman -S --needed --noconfirm < ~/dotfiles/packagelist/.config/pckgs #install packages
xargs yay -S --needed --noconfirm < ~/dotfiles/packagelist/.config/pckgs #yes I use yay, sue me 

``` 
## P.S

Please remember that whichever of these dotfiles you do end up using, you will have to replace my username "tagilla" with your own.  
And make sure to check the configs for the directories they require, I recall making some eccentric choices for some of them. 
All in all, just take care to fit the dots to your setup. 
