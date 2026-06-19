function ggraph { git log --oneline --all --graph --decorate }
function ggraph-w-authors { git log --all --graph --decorate }
function gfetch { git fetch --all --tags }
function greset { git reset --hard }
function gclean { git clean -fdx }

function gsd { git diff --submodule=log }
function glog { git log --oneline --decorate --graph }
function glog-self { git log --author="$(git config user.name)" }

function gsu { git submodule update $args }
function gsf { git submodule update --force --rebase $args }
