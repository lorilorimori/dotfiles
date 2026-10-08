set -x

CURL_ANY="curl --fail --show-error --silent --location"

# packages which for any reason had to be removed,
# i.e. have flatpak-distributed alternatives
PKGS_REMOVE="
  firefox"

# common across systems packages
PKGS_TOOLS_BASE="
  flatpak
  wl-clipboard
  zsh
  git
  curl
  wget"

# virtualization-specific packages,
# weather current environment is a virtual machine
# or a future host of those
PKGS_VT="
  qemu \
  qemu-system-arm \
  uml-utilities \
  virt-manager \
  libguestfs-tools \
  spice-vdagent"
PKGS_MISC="
  p7zip-full \
  make \
  dmg2img \
  apt-rdepends"
PKGS_FLATPAK="
  org.mozilla.firefox \
  com.github.tchx84.Flatseal \
  org.keepassxc.KeePassXC \
  org.kde.kwrite \
  io.github.kolunmi.Bazaar \
  org.mozilla.Thunderbird \
  com.collaboraoffice.Office \
  dev.zed.Zed \
  io.dbeaver.DBeaverCommunity \
  com.jgraph.drawio.desktop \
  org.kde.krita \
  org.gimp.GIMP \
  net.drawpile.drawpile \
  org.inkscape.Inkscape \
  com.boxy_svg.BoxySVG \
  org.blender.Blender \
  io.github.OpenToonz \
  com.obsproject.Studio \
  org.remmina.Remmina \
  com.rustdesk.RustDesk \
"
PKGS_RUST_LOCKED="
  ripgrep \
  zellij \
  fd-find"

LOCAL_BIN="$HOME/.local/bin"
mkdir -p $LOCAL_BIN

sudo apt remove $PKGS_REMOVE
rm -rf ~/.firefox

sudo apt install $PKGS_TOOLS_BASE

$CURL_ANY \
  https://taskfile.dev/install.sh |
  sh -s -- -d -b $LOCAL_BIN
$CURL_ANY \
  https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh | sh
# pipe to zsh as a workaround for script failure in sh
$CURL_ANY \
  https://get.volta.sh | zsh
$CURL_ANY \
  https://astral.sh/uv/install.sh | sh
$CURL_ANY \
  https://sh.rustup.rs | sh

chsh --shell /usr/bin/zsh
# zinit packages are installed on the first run of zsh
# we run it here
zsh -f -c 'source "$HOME/.zshrc"'

~/.cargo/bin/cargo install --locked $PKGS_RUST_LOCKED
sudo apt install $PKGS_VT
sudo apt install $PKGS_MISC

volta install node@lts
volta install npm

$CURL_ANY \
  https://github.com/sj14/epoch/releases/download/v0.2.2/epoch_0.2.2_linux_amd64 \
  --output "$LOCAL_BIN/epoch"
chmod +x "$LOCAL_BIN/epoch"

flatpak install -y $PKGS_FLATPAK
