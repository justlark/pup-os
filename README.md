# PupOS 🐶

PupOS is a furry Linux distro built on [Fedora
Atomic](https://fedoraproject.org/atomic-desktops/).

## Why PupOS?

This distro mostly exists as a playground for exploring distro customization and
a tool for luring my friends into trying Linux by making it vaguely furry. Don't
take it too seriously.

## Changes

Here are the changes this distro makes from the base Fedora Silverblue image:

- Make the OS name appear as "PupOS" everywhere.
- Prompt the user on first login with a list of recommended software to install,
  via [Yafti](https://github.com/ublue-os/yafti/). They can revisit this menu at
  any time.
- Replace the Firefox RPM package with the flatpak.
- Replace [Gnome System Monitor](https://apps.gnome.org/SystemMonitor/) with
  [Resources](https://flathub.org/apps/net.nokyan.Resources).
- Swap out the default cursor theme for [Bibata Modern
  Ice](https://github.com/ful1e5/Bibata_Cursor).
- Swap out the default icon theme for
  [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme).
- Include the official [Status
  Icons](https://extensions.gnome.org/extension/7332/status-icons/) Gnome
  extension.
- Include several default floofy desktop backgrounds.
- Include several default fonts, including some [Nerd
  Fonts](https://www.nerdfonts.com/).
- Use the PupOS logo on the login page.
- Use the PupOS logo on the boot splash screen.
- Use the PupOS logo on the watermark that appears over the desktop background
  (this can be disabled).
- Set the default Gnome accent color to purple.
- Show the minimize and maximize buttons in the window titlebar by default.
- Include [distrobox](https://distrobox.it/).
- Include [udev rules for
  Steam](https://github.com/ValveSoftware/steam-devices).

## Install

To build a PupOS ISO, you'll need to [install
Rust](https://www.rust-lang.org/tools/install) and run this command to install
the BlueBuild CLI:

```bash
cargo install --locked blue-build
```

Then you can run this command to build the ISO:

```bash
bluebuild generate-iso --iso-name pup-os.iso image ghcr.io/justlark/pup-os
```

## Rebase

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

## Credits

See the [Credits](./docs/credits.md) page for attributions and sources for
resources checked into this repo.

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
