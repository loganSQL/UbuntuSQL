# git basic
# https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository

# clone it
git clone https://github.com/loganSQL/UbuntuSQL.git myclone

# https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes
git remote -v
git status
git status -s
git diff
git diff --staged
git diff --cached
# staged it
git add 02_bash/
git add 02_bash/bash_scripts
# commit : only commit those staged
git commit -m "bash basic"
# Skipping the Staging Area
# commit all even without add (staged)
git commit -a -m 'added new benchmarks'
# rm files
# rm locally
rm mytest.txt
# staged the rm
git rm mytest.txt
# This command removes all files that have the .log extension in the log/ directory
git rm log/\*.log
# This command removes all files whose names end with a ~
git rm \*~
# move file
git mv file_from file_to
# Push
git push origin master

# Viewing the Commit History
git log
# show only 2 entries
git log -p -2
# show stats
git log --stat

# amend
# if you commit and then realize you forgot to stage the changes in a file you wanted to add to this commit
git commit -m 'initial commit'
git add forgotten_file
git commit --amend

# Unstaging a Staged File 
# use "git reset HEAD <file>..." to unstage
git add *
git status
#### unstaged oneoffile
git reset HEAD oneoffile
git status

# Unmodifying a Modified File
# use "git checkout -- <file>..." to discard changes in working directory
git status
git checkout -- myunwantedfile

