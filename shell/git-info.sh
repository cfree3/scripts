#!/bin/sh
# git-info.sh | Curtis Free (http://curtisfree.com)
# Simple script that provides a concise string of information about the current Git
# repository; this is intended for inclusion in a shell prompt.

# NOTE: This script is 

# Output:(<branch>+@!)
# * <branch> is the branch name
# * + indicates that there are staged changes
# * @ indicates that there are unstaged changes
# * ! indicates that there are untracked files
# Nothing will be returned (not even the parens) if not in a Git repo.

# Some references consulted when writing this script:
# * http://eseth.org/2010/git-in-zsh/
# * http://www.zsh.org/mla/users/2006/msg00922.html

# use `git show` to determine if in a Git repository
if git show &>/dev/null; then

    # get the branch name
    branch=$(git branch | grep "^*" | cut -c 3-)

    # check to see if there are any staged changes
    staged=$(git diff --cached)

    # check to see if there are any unstaged changes
    unstaged=$(git diff)

    # check to see if there are any untracked files
    untracked=$(git st | grep "^# Untracked")

    # build the prompt
    info=${branch}
    [ "${staged}" ]    && info="${info}+"
    [ "${unstaged}" ]  && info="${info}@"
    [ "${untracked}" ] && info="${info}!"

    echo -e "(${info})"

fi

