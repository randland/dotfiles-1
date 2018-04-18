# Dotfiles

## Dual Boot
I dual boot mac and linux and roughly followed [this guide](https://www.lifewire.com/dual-boot-linux-and-mac-os-4125733) to set it up.

## Mac
### Installing Fonts
* Run the `bin/dependencies.sh` file
* Open the font file saved in `mac_config` and install it to the Mac Font Book
* In iTerm, set the font to that font for the current profile
* Restart vim and you should see devicons

### Syncing Mac Mail Rules
* To save local rule to the repo `mac_config/mail/upload_local_rules.sh`
* To apply repo rules to the local mac mail `mac_config/mail/apply_dotfile_rules.sh`

### Sequel Pro
- Dark query scheme found in `mac_config/sequel-pro-master`

### Additional environment configurations
* Chrome theme - Dark Theme v3

### Userscripts
Stored in bookmarks on my googlde chrome account.

### NVM
I set the system ~/.nvmrc -> dotfiles/nvmrc and have that fetching `node` which is the latest node version. Any project without a .nvmrc will use the latest since it will traverse up the dirs to find my root one

### TMUX
Default config taken from [oh-my-tmux](https://github.com/gpakosz/.tmux)

### Alfred
- I use [this script](https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred) to get Alfred <> iTerm2 integration

### VIM
- Followed [this guide](https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html) to set up ctags using git hooks

### Music
Music is synced to my personal server space using `/mac/scripts/upload_music`. This only uploads the file difference.
