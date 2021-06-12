#! /bin/bash

for repo in `curl  -s "https://api.github.com/orgs/awsdocs/repos?per_page=100&page=1" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1;
             curl  -s "https://api.github.com/orgs/awsdocs/repos?per_page=100&page=2" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1;
             curl  -s "https://api.github.com/orgs/awsdocs/repos?per_page=100&page=3" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1;
             curl  -s "https://api.github.com/orgs/awsdocs/repos?per_page=100&page=4" | grep -e 'git_url*' | cut -d \" -f 4 | cut -d / -f 5 | cut -d . -f 1;`; do
    if [ -d $repo ]; then
        git pull $repo
    else
        git submodule add ssh://git@github.com/awsdocs/$repo.git
    fi
done

