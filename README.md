# npm-install-or-yarn-after-git-merge-checkout-rebase
An example of a Node.js project that utilizes [the npm package Husky](https://www.npmjs.com/package/husky) and git hooks for automatic execution of `npm install` (or `yarn`) after `git merge`, `git checkout` or `git rebase`, **if needed**.

## How to Use
1. Install husky: `npm install --save-dev husky`
2. Copy and use the relevant scripts from this repository for `npm` (./githooks/npm/) or `yarn` (./githooks/yarn/).
3. In `package.json`, add the git hooks using husky:

    ```json
    {
        ...
        "husky": {
            "hooks": {
                "post-checkout": "./githooks/npm/post-checkout.sh $HUSKY_GIT_PARAMS",
                "post-merge": "./githooks/npm/post-merge.sh"
            }
        }
    }
    ```

## How It Works
Both scripts (`post-checkout.sh` & `post-merge.sh`) use `git diff` in order to find which files have been updated by comparing two commits. Then, by using `grep`, the scripts check if `package-lock.json` (for `npm`) or `yarn.lock` (for `yarn`) are among the updated files.
- For *merge*: `git diff HEAD^ HEAD` - compare the previous commit (`HEAD^`) with the current commit (`HEAD`). We compare these commits because `git merge` creates a new commit of the merge itself.

- For *checkout*: We use the enivronment variable provided by husky `$HUSKY_GIT_PARAMS` in the `post-checkout.sh` script in order to provide `git diff` the source & target commits (of the source & target branches, respectively).   

- For *rebase*: `git checkout` is executed as part of `git rebase`, so `post-checkout.sh` is executed in this scenario.

Flags used:
- `git diff --name-only`
    - `--name-only` - Show only the names of the changed files.
- `grep -x -q`
    - `-x` - Select only matches that exactly match the whole line.
    - `-q` - Do not write anything to standard output, but only return the exit status code.