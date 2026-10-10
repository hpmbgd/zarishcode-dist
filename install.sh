#!/usr/bin/env bash
# zarishcode — one-line installer.
#
#   curl -fsSL https://raw.githubusercontent.com/hpmbgd/zarishcode-dist/main/install.sh | bash
#
# Downloads the zarishcode pack (bin/, defaults/, README) from the public
# distribution repo, installs the `zarishcode` + `zarishcode-setup` commands
# into ~/.local/bin (or $ZARISHCODE_DIR), then runs first-run setup. The
# private fork repository is never touched by this script.
set -euo pipefail

asset_url="https://github.com/hpmbgd/zarishcode-dist/releases/latest/download/zarishcode.tar.gz"
dest="${ZARISHCODE_DIR:-$HOME/.local/share/zarishcode}"
bin_dir="$HOME/.local/bin"

say() { printf '%s\n' "$*"; }

mkdir -p "$dest" "$bin_dir"
say "Downloading zarishcode pack…"
curl -fsSL "$asset_url" | tar -xz -C "$dest" --strip-components=1
chmod +x "$dest/bin/zarishcode" "$dest/bin/zarishcode-setup"
ln -sf "$dest/bin/zarishcode" "$bin_dir/zarishcode"
ln -sf "$dest/bin/zarishcode-setup" "$bin_dir/zarishcode-setup"
say "✓ installed zarishcode to $dest"
say ""
say "Running first-run setup (never overwrites existing config)…"
"$dest/bin/zarishcode-setup"