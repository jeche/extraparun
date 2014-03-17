extraparun
==========

##### Quick Link  
[Current Phase](#currentphase)  
[Associate Commit and Issues](#associate)  
[Fork a Repo](#fork)  
[Commit to your Repo](#commit)  
[Submit a Pull Request](#pull)  

<a name="Current Phase"/>
## Current Phase: DEVELOP SPRINT 1
[Heroku Deployment](http://extraparun.herokuapp.com)

[Ruby on Rails Tutorials](http://guides.rubyonrails.org/getting_started.html)

[User Authentication Tutorial](http://ruby.railstutorial.org/chapters/, see jdev branch for examples.)

Do not edit in jdev please.

<a name="associate"/>
## Associate Commit and Issues
When finish doing work for an issue add all the files to a new commit and then commit with one of the following phrases in the message:
    close
    closes
    closed
    fix
    fixes
    fixed
    resolve
    resolves
    resolved
followed by a hashtag and then the number of the issue you are attempting to close.  In order to make sure the correct issue is closed in each one please also commit with the following message:

Example: Attempting to close issues 34, 23, 42(in the extraparun repo that Jessica owns), 

        "This fixes jeche/extraparun#34 and also resolves jeche/extraparun#23, closes jeche/extraparun#42"

If attempting to close an issue with a pull request instead of a commit you may similarly just type in the description of the pull request to close 43, 23, and 42:

        "closes #34, closes #23, closes #42"


To find the issue numbers assigned to you, you may look under the GitHub issues related to this project.

More tutorial on how to fix issues with a commit: https://help.github.com/articles/closing-issues-via-commit-messages

<a name="fork"/>
## Fork a Repo
Step 1: Click the fork button at the top of the page.

Step 2: Now you've got a copy of the repository on your github.  But this only exists online.  Now you need to make a copy locally.  If you go to your copy of the repository, there's a clone link that should look something like 

    https://github.com/Sara-lily/extraparun.git
Go to your terminal.  cd to the directory where you want to copy the repository from github into.  Run this command: `git clone yourlink`
Step 3: You now have a github directory on your machine.  Now you need to hook up your local repository with the one online.  Here's the command for that:  First, cd into the repository you just created.  Now run: `git remote add upstream https://github.com/jeche/extraparun.git`   This marks Jessica's master branch as the one you want to eventually merge all of your code into (DO NOT DIRECTLY COMMIT TO HERE EVER.  YOU CAN PULL BUT NOT COMMIT).

Step 4:  Now you just need to get all of the files.  Run: `git fetch upstream`  Yay, you did it!

<a name="commit"/>
## Commit to your Repo
Step 1: Add the files individually that you want to commit (protip: use the command `git status` to figure out which files have changed).  Command: `git add filetoadd`

Step 2: Commit the files.  Command: `git commit -m "Your message here (don't forget to include the issue you're fixing if you are fixing one)"`

Step 3: Push to your repository.  Command: `git push origin master` (Origin is the name of your repository--it's where the code originally came from.  Master is the branch you want to push to)

Step 4: If this code is ready for the master branch (aka it doesn't break ANYTHING and it's the finalized version of what you're working on) then follow the instructions for a pull request

<a name="pull"/>
## Submit a Pull Request
Step 1: Go to github.com and go to Jessica's master branch.  Up in the top-ish right side, there is a button that says "Pull Requests".  Click on that.

Step 2: Up in the top-ish right side of the new page is a button that says "New Pull Request".  Click that.

Step 3: Click "Create new pull request" in the middle of the page

Step 4: Now you should see a screen that has a spot for a title and a description.  Fill these in thouroughly.  This will help Jessica know how to merge your code into the master branch.  The bottom of this page shows the changes that you want to merge and how they're different from what's already in master.  When you're done, click "Send Pull Request".  
