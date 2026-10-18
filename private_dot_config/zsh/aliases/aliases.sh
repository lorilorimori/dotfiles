PATH_ALIASES="$PATH_ZSH_CONFIG_DIR/aliases"
for file in "$PATH_ALIASES"/aliases.*.sh; do
  source "$file"
done
