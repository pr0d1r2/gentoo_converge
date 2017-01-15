# gentoo_converge

Converge working Gentoo system.

## Setup

### Nodes configuration

Firstly you need to define submodule storing nodes information (most
probably this will be a private repo), for example:

```bash
git submodule add git@gitlab.com:pr0d1r2/gentoo_converge-nodes.git nodes
```

### SSH public keys

As next thing you need to define submodule storing SSH public keys (most
probably this will be a private repo), for example:

```bash
git submodule add git@gitlab.com:pr0d1r2/ssh_public_keys.git cookbooks/ssh-key/files/default
```

## Usage

### Chroot

Can be used on chroot phase with [gentoo_machine_bootstrap](https://github.com/pr0d1r2/gentoo_machine_bootstrap)

### Working machine

For example, run:

```bash
sh setup.sh 192.168.88.8
```
