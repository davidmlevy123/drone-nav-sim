#!/usr/bin/env bash
# enc|dec <in> <out>  — OpenPGP symmetric AES-256; passphrase from $KEY via stdin (never on the command line).
set -euo pipefail
: "${KEY:?missing key}"
G=(gpg --batch --yes --quiet --pinentry-mode loopback --passphrase-fd 0)
case "$1" in
  enc) printf '%s\n' "$KEY" | "${G[@]}" --symmetric --cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-mode 3 --s2k-count 65011712 -o "$3" "$2" ;;
  dec) printf '%s\n' "$KEY" | "${G[@]}" -d -o "$3" "$2" ;;
  *) exit 2 ;;
esac
