# 1. Zero to "It Works!"

- I decided to not bother with a separate git repo / submodule for `best_quotes` for now. I will do it later if it starts to cause problems
- Maybe I will create a parent directory containing both `best_quotes` and `rulers`
- TIL that gem works with git to know which files to include in the spec - I suppose that might be the reason for having `best_quotes` in its own repo
- I keep needing to delete my version of the gem before rebuilding it, anyone else?
- Exercise two is referencing `Array#sum` instead of `deeply_empty?`
- I will come back and make some weird monkey patches when I have more time

# 2. Your first controller

- I love the "code by magic" approach the examples (eg using `#get_controller_and_action` in `#call` first and implementing later)
- Why define methods for `Application` in two different files?
- `Object#const_get` cool. Does this assume controllers are not name spaced?
