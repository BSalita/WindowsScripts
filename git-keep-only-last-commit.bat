:: Purges previous commits keeping only latest commit.
:: Run this script in directory having a child directory of .git.
:: See Zeelot's answer: https://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository?rq=1
git checkout --orphan newBranch
git add -A
git commit
git branch -D master
git branch -m master
git push -f origin master
git gc --aggressive --prune=all