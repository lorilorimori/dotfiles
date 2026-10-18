PATH_TOOLS="$PATH_ZSH_CONFIG_DIR/tools"

for file in "$PATH_TOOLS"/tools.*.sh; do
  source "$file"
done
