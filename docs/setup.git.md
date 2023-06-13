# Setup git configuration

## Create and ad public key for github
First need to add the following lines to ~/.ssh/config
```
Host github
	Hostname github.com
	User git
	IdentityFile ~/.ssh/id_rsa_github
```

Then we need to create a new ssh key using the following commands.
```
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_github -N ''
```
The command creates a pair of key in `~/.ssh/`. 
We need to copy `~/.ssh/id_rsa_github.pub` to GitHub website under
`settings/ssh-keys`.

## Setup template commit message
To setup a template for commit messages, add the following content 
to `~/.git.commit.template`. 
```
#-----------------------------------------------#
Subject

#---------------------------------------------------------------------#
Problem


#---------------------------------------------------------------------#
Solution


#---------------------------------------------------------------------#
Notes

```

Use the following command to setup template.
```
git config --global commit.template ~/.git.commit.template
```


## Add gpg to sign commits
Use the following command to create a new gpg key
```
gpg --full-generate-key
```

Use the following command to list all the keys
```
gpg --list-keys
```

Then export the key via the following command.
```
gpg --armor --export 3AA5C34371567BD2
```

To set signing key for commit message use the following config
```
git config --global commit.gpgsign true
```


## Setup editor 
```
git config --global core.editor "vim"
```

After all gitconfig should look like this:
```
[user]
        email = mehrshad@mehrshad.io
        name = Mehrshad Lotfi Foroushani
[init]
        defaultBranch = main
[core]
        editor = nvim
[commit]
        template = /home/mehrshad/.git.commit.template
        gpgsign = true
```
