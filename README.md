# npm-install-after-git-merge-or-rebase
This repository is an example of an npm project with recommendation to run npm install (or yarn) after git merge (as part of git pull) or git rebase

```sh
    # git diff:
    # - '--name-only' - output file names that changed
    # - 'HEAD^ HEAD' -  find differences between last commit (HEAD^) and current code (HEAD)
    
    # grep:
    # - '-x' - select only matches that exactly match the whole line.
    # - '-q' - do not output the matched text but only return the exit status code
    
    # $1: the first argument passed to this function
    
    git diff --name-only HEAD^ HEAD | grep -x -q $1
```