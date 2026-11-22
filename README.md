# drone-nav-sim

Batch runner for closed-loop drone navigation simulations on GitHub Actions.

The simulation sources (`payload.gpg`) and every result this workflow produces are encrypted
(AES-256, OpenPGP symmetric). The key is not in this repository. Without it the workflow cannot
build or run anything, and its artifacts cannot be read.

The workflow can only be started by the repository owner (manual trigger, owner check).
