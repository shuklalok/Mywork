Legend:

| Symbol    | Meaning                                                              | Source                                                 |
| --------- | -------------------------------------------------------------------- | ------------------------------------------------------ |
| `feature` | current branch; replaced with `#tag` or `@commit` if not on a branch | `git status --ignore-submodules=dirty`                 |
| `master`  | remote tracking branch; only shown if different from local branch    | `git rev-parse --abbrev-ref --symbolic-full-name @{u}` |
| `⇣42`     | this many commits behind the remote                                  | `git status --ignore-submodules=dirty`                 |
| `⇡42`     | this many commits ahead of the remote                                | `git status --ignore-submodules=dirty`                 |
| `⇠42`     | this many commits behind the push remote                             | `git rev-list --left-right --count HEAD...@{push}`     |
| `⇢42`     | this many commits ahead of the push remote                           | `git rev-list --left-right --count HEAD...@{push}`     |
| `*42`     | this many stashes                                                    | `git stash list`                                       |
| `merge`   | repository state                                                     | `git status --ignore-submodules=dirty`                 |
| `~42`     | this many merge conflicts                                            | `git status --ignore-submodules=dirty`                 |
| `+42`     | this many staged changes                                             | `git status --ignore-submodules=dirty`                 |
| `!42`     | this many unstaged changes                                           | `git status --ignore-submodules=dirty`                 |
| `?42`     | this many untracked files                                            | `git status --ignore-submodules=dirty`                 |
| `─`       | the number of staged, unstaged or untracked files is unknown         | `echo $POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY` or `git config --get bash.showDirtyState` |

Reference: https://stackoverflow.com/questions/62072056/characters-1-and-2-in-command-prompt
