# Steps for git using SSH
#1. Generate an SSH key

#Open terminal to create ssh keys:

cd ~                 #Your home directory
ssh-keygen -t rsa    #Press enter for all values

#2. Associate the SSH key with the remote repository
#
#	https://github.com/settings/keys
#
#Copy the contents of your ~/.ssh/id_rsa.pub into the field labeled 'Key'.

#3. Set your remote URL to a form that supports SSH
git remote show origin
#You can SET-URL with:
#	git+ssh://git@github.com/logansql/UbuntuSQL
git remote set-url origin git+ssh://git@github.com/logansql/UbuntuSQL
