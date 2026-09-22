#!/bin/sh
# Install the herdr plugins that config.toml binds keys to (prefix+u -> linkhints).
# Re-runs when this file changes; skips machines without herdr.
PATH="$PATH:$HOME/.local/bin:/usr/bin"
herdr=$(command -v herdr) || exit 0
"$herdr" plugin list 2>/dev/null | grep -q '^- linkhints ' ||
  "$herdr" plugin install ultrakorne/herdr-link-hints --yes
