# git basic
# https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository

# clone it
git clone https://github.com/loganSQL/UbuntuSQL.git myclone

# https://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes
git remote -v

cd your_dir
git pull origin master

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

###########
# remotes
###########
# Clone: Showing Your Remotes
git clone https://github.com/logansql/UbuntuSQL
cd UbuntuSQL
git remote
git remote -v

# Adding Remote Repositories
git remote add sqldba https://github.com/logansql/SQLDBA
git remote -v
# now sqladba is the short name for URL

# Fetching from Your Remotes
# fetch to sqldba/master branch
# git fetch command only downloads the data to your local repository — it doesn’t automatically merge it with any of your work or modify what you’re currently working on. 
git fetch sqldba

# Pulling from Your Remotes
#If your current branch is set up to track a remote branch (see the next section and Git Branching for more information), you can use the git pull command to automatically fetch and then merge that remote branch into your current branch. This may be an easier or more comfortable workflow for you; and by default, the git clone command automatically sets up your local master branch to track the remote master branch (or whatever the default branch is called) on the server you cloned from. Running git pull generally fetches data from the server you originally cloned from and automatically tries to merge it into the code you’re currently working on
git fetch origin

# Push to remotes
#  you want to push your master branch to your origin server (again, cloning generally sets up both of those names for you automatically), then you can run this to push any commits you’ve done back up to the server:
git push origin master
# This command works only if you cloned from a server to which you have write access and if nobody has pushed in the meantime. If you and someone else clone at the same time and they push upstream and then you push upstream, your push will rightly be rejected. You’ll have to fetch their work first and incorporate it into yours before you’ll be allowed to push.

# Inspect a remote
git remote show origin

# Renaming and Removing Remotes
git remote rename sqldba sqldba_win
git remote

git remote remove sqldba_win
git remote



