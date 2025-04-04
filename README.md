# PupOS 🐶

🚧 This repo is under construction 🚧

PupOS is a furry Linux distro built on [Fedora
Atomic](https://fedoraproject.org/atomic-desktops/).

## ISO

To build a PupOS ISO, you'll need to [install
Rust](https://www.rust-lang.org/tools/install) and run this command to install
the BlueBuild CLI:

```bash
cargo install --locked blue-build
```

Then you can run this command to build the ISO:

```bash
sudo bluebuild generate-iso --iso-name pup-os.iso image ghcr.io/justlark/pup-os
```

## Installation

To rebase an existing Fedora Atomic installation to the latest build:

First rebase to the unsigned image, to get the proper signing keys and policies
installed:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/justlark/pup-os:latest
```

Reboot to complete the rebase:

```bash
systemctl reboot
```

Then rebase to the signed image, like so:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/justlark/pup-os:latest
```

Reboot again to complete the installation

```bash
systemctl reboot
```

## Verification

PupOS images are signed with [Sigstore](https://www.sigstore.dev/)'s
[cosign](https://github.com/sigstore/cosign). You can verify the signature by
downloading the [cosign.pub](./cosign.pub) file from this repo and running the
following command:

```bash
cosign verify --key cosign.pub ghcr.io/justlark/pup-os
```

## Copyright

Copyright © 2025 Lark Aster

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.
