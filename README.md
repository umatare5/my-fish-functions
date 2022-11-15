# my-fish-functions

Functions that my fish-shell uses.

<a href="https://fishshell.com/">
  <img src="https://badgen.net/badge/fish-shell/plugin?icon=terminal" alt="fish-shell plugin">
</a>

<a href="https://github.com/umatare5/my-fish-functions/blob/master/LICENSE">
  <img src="https://badgen.net/github/license/umatare5/my-fish-functions" alt="license">
</a>

## Installation

### [Fisher](https://github.com/jorgebucaran/fisher)

```sh
fisher install umatare5/my-fish-functions
```

### [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish)

```sh
omf install https://github.com/umatare5/my-fish-functions
```

## Prerequisite

- macOS Sierra 10.12 or later
- [fish shell](https://fishshell.com/)

  | Name                      | Installation Guide                                                                                                         |
  | ------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
  | Google Chrome             | [Link](https://www.google.co.jp/chrome)                                                                                    |
  | Docker Desktop            | [Link](https://www.docker.com/products/docker-desktop)                                                                     |
  | Wireshark                 | [Link](https://www.wireshark.org/download.html)                                                                            |
  | AWS CLI v2 (aws)          | [Link](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2-mac.html)                                      |
  | Google Cloud SDK (gcloud) | [Link](https://cloud.google.com/sdk/docs/install)                                                                          |
  | Terraform                 | [Link](https://www.terraform.io/downloads): `brew install hashicorp/tap/terraform`                                         |
  | coreutils                 | [Link](https://formulae.brew.sh/formula/coreutils): `brew install coreutils`                                               |
  | nload                     | [Link](https://github.com/rolandriegel/nload): `brew install nload`                                                        |
  | jq                        | [Link](https://github.com/stedolan/jq): `brew install jq`                                                                  |
  | exa                       | [Link](https://github.com/ogham/exa#homebrew): `brew install exa`                                                          |
  | bat                       | [Link](https://github.com/sharkdp/bat#on-macos-or-linux-via-homebrew): `brew install bat`                                  |
  | ripgrep                   | [Link](https://github.com/BurntSushi/ripgrep#installation): `brew install ripgrep`                                         |
  | tv                        | [Link](https://github.com/uzimaru0000/tv/tree/master): `brew install uzimaru0000/tap/tv`                                   |
  | duf                       | [Link](https://github.com/muesli/duf#macos): `brew install duf`                                                            |
  | git-jump                  | [Link](https://github.com/mykolaharmash/git-jump#install):<br>- `brew tap mykolaharmash/git-jump && brew install git-jump` |

## Usage

### Application

| Command | Description       |
| ------- | ----------------- |
| o       | `open` wrapper    |
| chrome  | Run Google Chrome |
| wshark  | Run Wireshark     |

### Development

| Command | Description                                                |
| ------- | ---------------------------------------------------------- |
| dc      | `docker container` wrapper                                 |
| di      | `docker image` wrapper                                     |
| g       | `git` wrapper                                              |
| ga      | `git add` wrapper                                          |
| gb      | `git branch` wrapper                                       |
| gci     | `git commit --message` wrapper                             |
| gcl     | `git clone --filter=blob:none` wrapper                     |
| gco     | `git checkout` wrapper                                     |
| gd      | `git diff` wrapper                                         |
| gdc     | `git diff --cached` wrapper                                |
| gdl     | `git diff --name-only` wrapper                             |
| gj      | `git jump` wrapper                                         |
| gl      | `git log --graph --format --date --decorate-refs` wrapper  |
| gp      | `git push origin HEAD` wrapper                             |
| gpt     | `git push --tags origin` wrapper (Override original `gpt`) |
| gr      | `git remote` wrapper                                       |

### Public Cloud

| Command   | Description                                                 |
| --------- | ----------------------------------------------------------- |
| alogin    | `aws sso login` wrapper                                     |
| atoken    | Print tokens issued by `alogin`                             |
| glogin    | `gcloud auth login` and `application-default login` wrapper |
| gtoken    | Print tokens issued by `glogin`                             |
| glist     | `gcloud config configurations list` wrapper                 |
| gactivate | `gcloud config configurations activate` wrapper             |
| gclist    | `gcloud compute instance list` wrapper                      |
| gcstop    | `gcloud compute instance stop` wrapper                      |
| gcstart   | `gcloud compute instance start` wrapper                     |
| gcssh     | `gcloud compute ssh --tunnel-through-iap` wrapper           |
| tf        | `terraform` wrapper                                         |

### Networking

| Command | Description                                  |
| ------- | -------------------------------------------- |
| bcon    | Print SSIDs detected on your Mac             |
| gip     | Print your outbound global IP                |
| wstat   | Print wireless network interface statistics  |
| wlan    | Print the information of wireless connection |
| wlog    | Print logs written by wireless interface     |
| xping   | Run `ping` with timestamp                    |

### Others

| Command      | Description                                                                      |
| ------------ | -------------------------------------------------------------------------------- |
| ll           | `exa -l -g --icons` wrapper                                                      |
| la           | `ll -a` wrapper                                                                  |
| cat          | `bat --plain --paging never` wrapper (Overwrite original `cat`)                  |
| date         | `gdate` wrapper (Overwrite original `date`)                                      |
| ag           | `rg --pretty` wrapper                                                            |
| dfx          | `duf --hide-fs nullfs` wrapper                                                   |
| rnd          | Generate a strings includes lowercase, uppercase, numeric and special characters |
| pa           | Find password in `~/.credentials/secrets.txt` wrapper                            |
| hosts        | Print hosts without comment-line and blank-line.                                 |
| xx           | `exit` wrapper                                                                   |
| fish_ls_path | List PATH in fish                                                                |
| fish_rm_path | Remove PATH from fish                                                            |
