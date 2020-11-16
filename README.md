# HP EliteDesk 800 G2 Tower PC (Skylake) for macOS Big Sur & Catalina

Hackintosh your HP EliteDesk 800 G2 Tower PC Skylake. This is intented to create a fully functional hackintosh for the HP EliteDesk 800 G2 Tower PC i7-6700 (Skylake).

## Important Notes
[up up up](#)

* This guide is for the **HP EliteDesk 800 G2 TWR PC i7-6700 (Skylake)**.
* Following this guide you can run **Big Sur 11.0.1**. and **Catalina 10.5.x up to 10.15.7**
* I stopped using **Clover**. This guide is for **OpenCore** only. If you need to run Clover for any reason you can check the older [Clover Guide](./README.clover.md)
* All files used and detailed readmes are located in github [sakoula/HP-EliteDesk-800-G2-6700](https://github.com/sakoula/HP-EliteDesk-800-G2-6700/blob/master/Changelog.md)
* The guide was fully tested with **BIOS N01 Ver. 2.36 07/18/2018**
* macOS has been installed on an internal SSD. I have no experience of having both Windows and macOS on a single disk.
* The following ports have been disabled to meet the maximum allowed ports in macOS USB back, bottom row/1rst from left/USB back, bottom row, 2nd from left/USB back, bottom row, 3rd from left/USB back, bottom row, 4rth from left. Please see [USB mapping](https://dortania.github.io/OpenCore-Post-Install/usb/#macos-and-the-15-port-limit) if you want to further customize it.

* In order to be able to help you please provide full debug information useing the excellent [black-dragon74/OSX-Debug
](https://github.com/black-dragon74/OSX-Debug) tool.
* Support and Discussion on this guide can be found at [tonymacx86.com](https://www.tonymacx86.com/threads/hp-elitedesk-800-g2-hp-prodesk-600-g2-success.261452/)

## Known Issues / Work in Progress
[up up up](#)

* sleep [hibernation](https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/) *has not checked and is not the focus of the guide*
* Audio through DisplayPorts *has not checked and is not the focus of the guide*
* Enable HiDPI resolutions *has not checked and is not the focus of the guide*

* in `sources.opencore/IM171_0105_B20-10.12.4.firmware update ACPI Tables.zip` and `sources.opencore/IM171_0110_B00 10.13.0GM ACPI Tables.zip` you can find `iMac 17,1` ACPI tables from [insanelymac](https://www.insanelymac.com/forum/topic/334060-original-imac-171-firmware-acpi-tables-dsdt-ssdts-etc/?_fromLogin=1). It may be used to create new SSDT patches. All firmwares seems that they are available [gdbinit/firmware_vault](https://github.com/gdbinit/firmware_vault/tree/master/EFI).

If you face another problem please open a issue.

## Hardware Specifications
[up up up](#)

* Product Number: L1G77AV
* HP EliteDesk 800 G2 Tower PC

hardware configuration with the following specs:

* Skylake
* [Skylake (100 series)](https://en.wikipedia.org/wiki/LGA_1151#Skylake_chipsets_(100_series))
* HP EliteDesk 800 G2 TWR
* MOBO HP 8053 (U3E1)
* Intel® 8 Q170
* BIOS 02.36
* Intel Core i7 6700 @ 3.40GHz Skylake
* GPU: Integrated: Intel® HD Graphics 530 with (2) DisplayPorts with multi - stream and VGA
* 32GB DDR4 2133 DIMM (Dual-Channel Unknown @ 1064MHz (15-15-15-36))
* Audio: Realtek ALC 221 Audio (revision 0x100103)
* Network: Intel® I219LM Gigabit Network Connection LOM
* 500GB Samsung V-NAND SSD 860 EVO MZ-76E500 (Model Code: MZ-76E500B/EU)
* 1000GB Seagate Barracuda 7200.14 ST1000DM003-1SB102 (SATA)
* 1000GB Western Digital Caviar Green WDC WD10EAVS-14M4B0 (SATA)
* display1: HP EliteDisplay E242
* display2: HP EliteDisplay E243i

full specs from the [HP site](http://store.hp.com/us/en/pdp/hp-elitedesk-800-g2-tower-pc-p-w5x93ut-aba--1)

---

## Table of Contents
[up up up](#)

<!-- MarkdownTOC -->

- [Dual Monitor](#dual-monitor)
- [Installation Guide](#installation-guide)
  - [Installation SSD](#installation-ssd)
  - [Keys Shortcuts to Boot](#keys-shortcuts-to-boot)
  - [BIOS setup](#bios-setup)
  - [Fixing CFG Lock](#fixing-cfg-lock)
  - [Preparing USB Flash Drive](#preparing-usb-flash-drive)
  - [Customize USB Flash Drive](#customize-usb-flash-drive)
  - [Generate a valid SMBIOS](#generate-a-valid-smbios)
  - [Install macOS](#install-macos)
  - [Post Install](#post-install)
  - [Enable TRIM for SSDs](#enable-trim-for-ssds)
  - [Clover to OpenCore Migration](#clover-to-opencore-migration)
  - [Sleep](#sleep)
- [Upgrade Guide](#upgrade-guide)
  - [Upgrade from `Catalina 10.15.3` to `Catalina 10.15.7`](#upgrade-from-catalina-10153-to-catalina-10157)
  - [Upgrade to `Big Sur 11.0.1`](#upgrade-to-big-sur-1101)
- [Benchmarking](#benchmarking)
  - [Benchmarking Windows 10](#benchmarking-windows-10)
  - [Benchmarking macOS 10.14.2 \(Clover\)](#benchmarking-macos-10142-clover)
  - [Benchmarking macOS 10.15.3 \(Clover\)](#benchmarking-macos-10153-clover)
  - [Benchmarking macOS 10.15.7 \(OpenCore\)](#benchmarking-macos-10157-opencore)
- [FAQ](#faq)
  - [Disabling SIP](#disabling-sip)
  - [OCB: LoadImage failed - Security Violation](#ocb-loadimage-failed---security-violation)
  - [MacOS installer thinks I am russian](#macos-installer-thinks-i-am-russian)
  - [OpenCore Sanity Checker](#opencore-sanity-checker)
  - [Mount Root as read/write](#mount-root-as-readwrite)
- [Changelog](#changelog)
- [Buy me a coffee or a beer](#buy-me-a-coffee-or-a-beer)
- [Credits](#credits)

<!-- /MarkdownTOC -->

<!--
* This line is a placeholder to generate the table of contents in jekyll
{:toc}

[TOC]
-->

## Dual Monitor
[up up up](#)

> Dual monitors works. Patching has been done using hackingtool. HotPlugging a monitor is not required. The following patch has been applied

```
WhateverGreen: weg @ (DBG) agdpmod using config vit9696
WhateverGreen: igfx @ (DBG) patching framebufferId 0x19120000 connector [1] busId: 0x05, pipe: 9, type: 0x00000400, flags: 0x00000187
WhateverGreen: igfx @ (DBG) patching framebufferId 0x19120000 connector [2] busId: 0x06, pipe: 10, type: 0x00000400, flags: 0x00000187
WhateverGreen: igfx @ (DBG) patching framebufferId 0x19120000 connector [3] busId: 0x04, pipe: 10, type: 0x00000400, flags: 0x00000187
WhateverGreen: igfx @ (DBG) patching framebufferId 0x19120000 connector [-1] busId: 0x00, pipe: 0, type: 0x00000001, flags: 0x00000020

Patch

General > Devices/Properties
General > Connectors
General > Auto Detect Changes
Advanced > FB Port Limit 3
Device Id: 0x1912: Intel HD Graphics 530
```

This configuration works with an `HP EliteDisplay E242` on the top DP port and an `HP EliteDisplay E243i` on the bottom DP port. Very rarely when I pass the boot process and once it turns into 'graphics mode' (Apple Logo) the machine sometimes hangs there for some seconds and reboots (Framebuffer is crashing).

I noticed that if I have only one monitor on the top DP port (any) the coputer boots fine and then I can hot plug the other monitor once on the logon screen I do not have any problem.

## Installation Guide
[up up up](#)

These are the steps in order to install or upgrade your EliteDesk-800. There is a very detailed document on the steps followed and the customizations which can be found in [DETAILS.opencore.md](DETAILS.opencore.md).

There is a another document on how I setup my environment including all the tools and utilities I have used [ENVIRONMENT.wks.md](ENVIRONMENT.wks.md).

Start by downloading the latest version the customization files from the [releases](https://github.com/sakoula/HP-EliteDesk-800-G2-6700/releases) page. It includes:

* `ELITEDESK800_EFI/`: efi directory including all kexts and customization needed

The guide is being written based on the excellent [Dortania guides](https://dortania.github.io/getting-started/)

### Installation SSD
[up up up](#)

I have installed macOS on the internal `500GB Samsung V-NAND SSD 860 EVO MZ-76E500 (Model Code: MZ-76E500B/EU)`.

### Keys Shortcuts to Boot
[up up up](#)

* `F9` Boot Menu
* `F10` BIOS
* `<ESC>` Startup Menu

### BIOS setup
[up up up](#)

Make sure that you check with this [link](http://support.hp.com/us-en/product/hp-elitedesk-800-g2-tower-pc/7633297/drivers) to update BIOS:

* `sp90164`: HP EliteDesk 800 G2 TWR/SFF SystemBIOS (N01) / 02.36 Rev.A / Aug 13, 2018

> Note: Update the BIOS from the BIOS itself. On a USB stick with an EFI directory place bios file *N01_0236.bin* in directory *EFI/HP/BIOS/new*. On Finder create an extra EFI directory under the mounted EFI exactly as OpenCore do.

Get into the `BIOS` and make the following changes:

BIOS Settings:

* ~~Broke Raid without any problem on booting from one disk~~ (computer came with no raid)
* ~~Setup disk as AHCI~~ (there is no option on the BIOS)
* `Advanced > Security > TPM Embedded Security > TPM Device` **Hidden**
* `Advanced > Security > BIOS SureStart >` **Unchecked ALL**
* `Advanced > Security > System Management Command` **Unchecked**
* `Advanced > Security > SIntel Software Guard Extensions (SGX)` **Disable**
* `Advanced > Boot Options > UEFI boot order` **Checked** (do this or else it will not boot from the stick)
* `Advanced > Boot Options > Audio Alerts During Boot` **Unchecked**
* `Advanced > Secure Boot Configuration >` **Unchecked ALL**
* `Advanced > Secure Boot Configuration > Configure Legacy Support and Secure Boot` **Legacy Support Enable and Secure Boot Disable**
* `Advanced > System Options > Configure Storage Controller for RAID` **Unchecked**
* `Advanced > System Options > VTx` **Checked**
* `Advanced > System Options > VTd` **Unchecked**
* `Advanced > System Options > PCI*` **Unchecked**
* `Advanced > System Options > Allow PCIe/PCI SERR# Interrupt` **Checked**
* `Advanced > Built-In Device Options > Video memory size` **512MB** [here](https://www.tonymacx86.com/threads/skylake-intel-hd-530-integrated-graphics-working-as-of-10-11-4.188891/page-40)
* `Advanced > Built-In Device Options > Audio Device` **Checked**
* `Advanced > Built-In Device Options > Internal Speakers` **Checked**
* `Advanced > Port Options > Serial Port A` **Unchecked**
* `Advanced > Port Options > SATA*` **Checked**
* `Advanced > Port Options > *USB*` **Checked**
* `Advanced > Port Options > USB Charging Port Function` **Checked**
* `Advanced > Port Options > Media Card Reader/SD_RDR USB` **Checked**
* `Advanced > Port Options > Restrict USB Devices` **Allow all USB Devices**
* `Advanced > Power Management Options > Runtime Power Management` **Checked**
* `Advanced > Power Management Options > Extended Idle Power States` **Checked**
* `Advanced > Power Management Options > S5 Maximum Power Savings` **Checked**
* `Advanced > Power Management Options > SATA Power Management` **Checked**
* `Advanced > Power Management Options > PCI Express Power Management` **Checked**
* `Advanced > Power Management Options > Power On from Keyboard Ports` **Unchecked**
* `Advanced > Power Management Options > Unique Sleep State Blink Rates` **Unchecked**
* `Advanced > Remote Management Options > Active Management (AMT)` **Unchecked**
* `Advanced > Option ROM Launch Policy > Configure Option ROM Launch Policy > All UEI` for the multimonitor support on boot

### Fixing CFG Lock
[up up up](#)

**`CFG Lock` removal is not required**.

It may be better to remove it. However this cannot be done easily on this BIOS since there is no hidden toggle in the BIOS setup as in others. This is a work in progresss. If you managed to patch it in any way please contact me.

There is a number of information on the Internet. Start here [Fixing CFG Lock](https://dortania.github.io/OpenCore-Post-Install/misc/msr-lock.html#what-is-cfg-lock) and see the following reddit posts:

* [HP EliteDesk 800 G5 DM, Catalina 10.15.7](https://www.reddit.com/r/hackintosh/comments/jdzh6n/hp_elitedesk_800_g5_dm_catalina_10157/)
* [CFG LOCK/Unlocking - Alternative method](https://www.reddit.com/r/hackintosh/comments/hz2rtm/cfg_lockunlocking_alternative_method/)
* [ThinkPad CFG Lock](https://www.reddit.com/r/hackintosh/comments/g3n7ku/thinkpad_cfg_lock/)

cannot be removed in this BIOS. This is a work in progress.

### Preparing USB Flash Drive
[up up up](#)

[Get a at least 16GB](https://support.apple.com/en-us/HT201372) USB Flash Drive and follow [Creating the USB > Making the installer](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/). Follow just the `Making the installer Guide`.

If you need just a USB stick with OpenCore installation for booting an existing MacOS installation just format the USB stick as following:

`Disk Utility > Select USB Device > Erase`:

* Scheme = GUID Partition Map
* Name: OC
* Format: macOS Extended (Journaled)

### Customize USB Flash Drive
[up up up](#)

In this step you will add all the required opencore files to the USB flash drive.

Download the latest [release](https://github.com/sakoula/HP-EliteDesk-800-G2-6700/releases) from github and unzip the archive. You will find an `ELITEDESK800_EFI` directory. Mount the USB Flash Drive's `EFI` partition on `/Volumes/EFI`. You can do this with many utilities (e.g. [MountEFI](https://github.com/corpnewt/MountEFI) or [mount_efi.sh](https://github.com/black-dragon74/OSX-Debug/blob/master/mount_efi.sh)).

Move the `ELITEDESK800_EFI` to `/Volumes/EFI` and rename it to `EFI`. It will look like `/Volumes/EFI/EFI`

### Generate a valid SMBIOS
[up up up](#)

Use [corpnewt/GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) to generate a valid `iMac17,1` SMBIOS and populate the following `/Volumes/EFI/OC/config.plist` with a text editor or [corpnewt/ProperTree](https://github.com/corpnewt/ProperTree):

```xml
<key>PlatformInfo</key>
<dict>
    ...
    <key>MLB</key>
    <string>XXXXXXXXXXXXXXXXX</string>
    ...
    <key>SystemSerialNumber</key>
    <string>XXXXXXXXXXXX</string>
    ...
    <key>SystemUUID</key>
    <string>XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX</string>
    ...
</dict>
```

a valid SMBIOS is really important for Apple Services, iMessage & FaceTime. Check also the guide [An iDiot's Guide To iMessage ](https://www.tonymacx86.com/threads/an-idiots-guide-to-imessage.196827/)

### Install macOS
[up up up](#)

During the first time you boot you **must** clear the NVRAM of the system (Clover and other Bootloader leave traces)

To boot from the USB Flash Drive you can just hit `F9` and you will get the UEFI boot loader. Once you get to Clover hit `space` and select `CleanNvram.efi`. After it completes power off the computer wait for ten seconds and power on again.

Boot again and [Install macOS](https://dortania.github.io/OpenCore-Install-Guide/installation/installation-process.html#macos-installer)

### Post Install
[up up up](#)

At this point OpenCore boot loader is installed only in the USB driver. You are required to install it on your bootable disk. Follow [Moving OpenCore from USB to macOS Drive](https://dortania.github.io/OpenCore-Post-Install/universal/oc2hdd.html#moving-opencore-from-usb-to-macos-drive)

### Enable TRIM for SSDs
[up up up](#)

Since OpenCore does not reccomends to patch for TRIM using the bootloader you need to enable TRIM for all SSDs manually. Open terminal and use command: `sudo trimforce enable`. Reboot and check that TRIM is enabled on the `Apple > About this Mac > System Report`.

### Clover to OpenCore Migration
[up up up](#)

This section is for those who run Clover and want to migrate to OpenCore. You need to:

1. make sure you have a **backup USB flash drive** with clover in order to boot your system. Check [README.clover.md](./README.clover.md). If something goes wrong you may end up with an unbootable system! You have been warned!

2. Create a USB flash drive without the macos installer. check [Preparing USB Flash Drive](#preparing-usb-flash-drive) and [Customize USB Flash Drive](#customize-usb-flash-drive).

3. Remove Clover. Check [Converting from Clover to OpenCore](https://github.com/dortania/OpenCore-Install-Guide/tree/master/clover-conversion). TLDR you need to [Cleaning the Clover Junk in macOS](https://github.com/dortania/OpenCore-Install-Guide/tree/master/clover-conversion#cleaning-the-clover-junk-in-macos) and [Removing kexts from macOS(S/L/E and L/E)](https://github.com/dortania/OpenCore-Install-Guide/tree/master/clover-conversion#removing-kexts-from-macossle-and-le)

4. Most likely you will hit the [stuck on OCB: LoadImage failed - Security Violation](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/kernel-issues.html#stuck-on-ocb-loadimage-failed-security-violation). Follow the link and fix it now. **Do not disable SecureBootModel**. Follow the terminal instructions

5. Boot from the USB and Clear the NVRAM. Check [Install macOS](#install-macOS) section.

6. Boot from the USB flash drive. Make sure you have a working system

7. Move OpenCore from USB to macOS Driver. Check [Post Install](#post-install)

### Sleep
[up up up](#)

check your current state:

```shell_session
$ sudo pmset -g
System-wide power settings:
Currently in use:
 standby              1
 Sleep On Power Button 1
 womp                 1
 autorestart          0
 hibernatefile        /var/vm/sleepimage
 proximitywake        1
 powernap             1
 networkoversleep     0
 disksleep            10
 standbydelayhigh     86400
 sleep                0 (sleep prevented by screensharingd)
 autopoweroffdelay    28800
 hibernatemode        3
 autopoweroff         1
 ttyskeepawake        1
 displaysleep         0
 highstandbythreshold 50
 standbydelaylow      0
```

Be aware that hibernation (suspend to disk or S4 sleep) is not supported on hackintosh.

You should disable it:

```shell
sudo pmset -a hibernatemode 0
sudo rm /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
```

Always check your hibernatemode after updates and disable it. System updates tend to re-enable it, although the trick above (making sleepimage a directory) tends to help.

And it may be a good idea to disable the other hibernation related options:

```shell
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a proxymitywake 0
```

## Upgrade Guide
[up up up](#)

### Upgrade from `Catalina 10.15.3` to `Catalina 10.15.7`
[up up up](#)

Upgrade from within macOS. No special action is needed

### Upgrade to `Big Sur 11.0.1`
[up up up](#)

Use the latest release from here boot in Catalina and upgrade.

## Benchmarking
[up up up](#)

### Benchmarking Windows 10
[up up up](#)

* `GeekBench x64 4.0.3 CPU` 4796/15263
* `GeekBench x64 4.0.3 CPU` 4787/15225
* `GeekBench x64 4.0.3 GPU/OpenCl` 21496
* `GeekBench x64 4.0.3 GPU/OpenCl` 21479
* `CINEBENCH R15.038_RC184115 OpenGL` 55.71fps
* `CINEBENCH R15.038_RC184115 OpenGL` 55.53fps
* `CINEBENCH R15.038_RC184115 CPU` 824cb
* `CINEBENCH R15.038_RC184115 CPU` 821cb
* `LuxMark-v3.1 OpenCL GPU` 2544
* `LuxMark-v3.1 OpenCL GPU` 2541
* `LuxMark-v3.1 OpenCL CPU` 2253
* `LuxMark-v3.1 OpenCL CPU` 2274
* `LuxMark-v3.1 Native C++` 2569
* `LuxMark-v3.1 Native C++` 2532

### Benchmarking macOS 10.14.2 (Clover)
[up up up](#)

* `GeekBench x64 4.3.2 CPU` 4490/16686
* `GeekBench x64 4.3.2 GPU/OpenCl` 32007
* `GeekBench x64 4.3.2 GPU/Metal` 23400
* `CINEBENCH R15.038_RC184115 OpenGL` 29.91fps
* `CINEBENCH R15.038_RC184115 CPU` 810cb
* `LuxMark-v3.1 OpenCL GPU` 2141
* `LuxMark-v3.1 OpenCL CPU` 1773
* `Heaven FPS` 13.2 `Score` 332 `Min FPS` 9.6 `Max FPS` 26.1
* `AJA System Test Lite SanDisk (with trim) SanDisk SD7SB3Q-256G-1006:` 217MB/sec write, 400MB/sec read
* `AJA System Test Lite Seagate Barracuda 7200.14 ST1000DM003-1SB102:` 140MB/sec write, 161MB/sec read
* `AJA System Test Lite Western Digital Caviar Green WDC WD10EAVS-14M4B0:` 84MB/sec write, 91MB/sec read

### Benchmarking macOS 10.15.3 (Clover)
[up up up](#)

* `GeekBench x64 4.3.2 CPU` 4824/16966
* `GeekBench x64 4.3.2 GPU/OpenCl` 32249
* `GeekBench x64 4.3.2 GPU/Metal` 23928
* `CINEBENCH R15.038_RC184115 OpenGL` 30.46fps
* `CINEBENCH R15.038_RC184115 CPU` 760cb
* `LuxMark-v3.1 OpenCL GPU` 2240
* `LuxMark-v3.1 OpenCL CPU` 1914
* `Heaven FPS` 12.9 `Score` 324 `Min FPS` 8.9 `Max FPS` 20.8 (fullscreen/Quality:Medium/Tessellation:Disabled/Anti-aliasing:off/Stereo3D:Disabled)
* `AJA System Test Lite SanDisk (with trim) Samsung 860 EVO MZ-76E500B/EU:` 491MB/sec write, 522MB/sec read
* `AJA System Test Lite Seagate Barracuda 7200.14 ST1000DM003-1SB102:` 127MB/sec write, 144MB/sec read
* `AJA System Test Lite Western Digital Caviar Green WDC WD10EAVS-14M4B0:` 65MB/sec write, 62MB/sec read

### Benchmarking macOS 10.15.7 (OpenCore)
[up up up](#)

* `GeekBench x64 4.3.2 CPU` 5128/17340
* `GeekBench x64 4.3.2 GPU/OpenCl` 33472
* `GeekBench x64 4.3.2 GPU/Metal` 23276
* `CINEBENCH R15.038_RC184115 OpenGL` 29.41 fps
* `CINEBENCH R15.038_RC184115 CPU` 796cb
* `LuxMark-v3.1 OpenCL GPU` 2204
* `LuxMark-v3.1 OpenCL CPU`
* `Heaven FPS`  `Score`  `Min FPS`  `Max FPS`
* `AJA System Test Lite SanDisk (with trim) Samsung 860 EVO MZ-76E500B/EU:` 456MB/sec write, 490MB/sec read
* `AJA System Test Lite Seagate Barracuda 7200.14 ST1000DM003-1SB102:` 122MB/sec write, 130MB/sec read
* `AJA System Test Lite Western Digital Caviar Green WDC WD10EAVS-14M4B0:` 61MB/sec write, 70MB/sec read

## FAQ
[up up up](#)

### Disabling SIP
[up up up](#)

[Disabling SIP](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/post-issues.html#disabling-sip)

### OCB: LoadImage failed - Security Violation
[up up up](#)

Users may find upgrading OpenCore on an already installed system can result in early boot failures due to `Security > SecureBootModel > Default`
[OCB: LoadImage failed - Security Violation](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/kernel-issues.html#stuck-on-ocb-loadimage-failed-security-violation)

### MacOS installer thinks I am russian
[up up up](#)

[macOS installer in Russian](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/extended/userspace-issues.html#macos-installer-in-russian)

### OpenCore Sanity Checker
[up up up](#)

make sure to check your config.plist against [OpenCore Sanity Checker](https://opencore.slowgeek.com/)

### Mount Root as read/write
[up up up](#)

Apple has introduce SSV (signed system volumes). SSV features a kernel mechanism that verifies the integrity of the system content at runtime, and rejects any data — code and non-code — that doesn’t have a valid cryptographic signature from Apple. In order to make root volume writable you need to disable, mount it, change it, create a new snapshot and boot from that snapshot. **I am not responsible if you make your machine unbootable. This may break OS updates**. Check how to do it @ [macOS 11 Big Sur](https://egpu.io/forums/postid/82119/) and [Mount root as writable in Big Sur](https://apple.stackexchange.com/questions/395508/mount-root-as-writable-in-big-sur)

Steps:

1. Boot from recovery and disable SSV (this will be permanent)

```bash
csrutil authenticated-root disable
```

2. Boot on macos and mount your root volume as writable. Find your root mount's device - run mount and chop off the last s, e.g. if your root is `/dev/disk1s2s3`, you'll mount `/dev/disk1s2`

```bash
$ mount
/dev/disk2s5s1 on / (apfs, sealed, local, read-only, journaled)
$ mkdir /Users/xxx/mount
sudo mount -o nobrowse -t apfs /dev/disk2s5 /Users/xxx/mount
```

3. Make any modifications you want in `/Users/xxx/mount`

4. Generate and tag new APFS System Snapshot as follows and make it bootable

```bash
# Create snapshot.
sudo /System/Library/Filesystems/apfs.fs/Contents/Resources/apfs_systemsnapshot -s "ChangedRoot" -v /Users/xxx/mount

# Tag snapshot for next boot.
sudo /System/Library/Filesystems/apfs.fs/Contents/Resources/apfs_systemsnapshot -r "ChangedRoot" -v /Users/xxx/mount
```

5. reboot and you are done

6. check the snapshots **XXX how do you delete snapshot history?**

```shell
$ diskutil apfs snapshots disk2s5s1
Snapshots for disk2s5s1 (3 found)
|
+-- AFD82B0C-23D3-481B-9401-0A17DC46C1EC
|   Name:        com.apple.os.update-779BDF1556C6F688504E24FB29C75AFFABFCB91E701806FFFF35235E19914F1E
|   XID:         489684
|   Purgeable:   No
|   NOTE:        This snapshot limits the minimum size of APFS Container disk2
|
+-- 4A6FACBE-2667-4127-8143-646C38E3C3B4
|   Name:        ChangedRoot
|   XID:         490985
|   Purgeable:   Yes
|
+-- 3DC0C93D-F858-4420-AC0B-49FDF23D5C3A
    Name:        NewRoot
    XID:         9223372036855268389
    Purgeable:   Yes
```

## Changelog
[up up up](#)

You can view [Changelog](Changelog.md) for detailed information.

## Buy me a coffee or a beer
[up up up](#)

If you feel so you can [buy me](http://google.com) a coffee or a beer!

## Credits
[up up up](#)

- Thanks to [Piker-Alpha](https://pikeralpha.wordpress.com/)

- Thanks to [vit9696/Acidanthera](https://github.com/acidanthera) for providing [AppleALC](https://github.com/acidanthera/AppleALC), [CPUFriend](https://github.com/acidanthera/CPUFriend), [HibernationFixup](https://github.com/acidanthera/HibernationFixup), [Lilu](https://github.com/acidanthera/Lilu), `USBPorts`, [VirtualSMC](https://github.com/acidanthera/VirtualSMC), and [WhateverGreen](https://github.com/acidanthera/WhateverGreen).

- Thanks to [Dortania](https://dortania.github.io/) for their amazing guides!

- Thanks to [apianti](https://sourceforge.net/u/apianti), [blackosx](https://sourceforge.net/u/blackosx), [blusseau](https://sourceforge.net/u/blusseau), [dmazar](https://sourceforge.net/u/dmazar), and [slice2009](https://sourceforge.net/u/slice2009) for providing [Clover](https://sourceforge.net/projects/cloverefiboot).

- Thanks to [RehabMan](https://github.com/RehabMan) for providing [EAPD-Codec-Commander](https://github.com/RehabMan/EAPD-Codec-Commander), [OS-X-Clover-Laptop-Config](https://github.com/RehabMan/OS-X-Clover-Laptop-Config), [OS-X-Null-Ethernet](https://github.com/RehabMan/OS-X-Null-Ethernet), [OS-X-ACPI-Battery-Driver](https://github.com/RehabMan/OS-X-ACPI-Battery-Driver), [OS-X-Voodoo-PS2-Controller](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller), and [SATA-unsupported](https://github.com/RehabMan/hack-tools/tree/master/kexts/SATA-unsupported.kext) and all the amazing help in the forums.

- Thanks to [sniki](https://www.tonymacx86.com/members/sniki.1501160/) and his guide on [[Guide] HP Elite 8300 / HP 6300 Pro using Clover UEFI hotpatch](https://www.tonymacx86.com/threads/guide-hp-elite-8300-hp-6300-pro-using-clover-uefi-hotpatch.265384/)

- Thanks to [edelton](https://www.tonymacx86.com/members/edelton.1923477/) and his guide [HP EliteDesk 800 G2 / HP ProDesk 600 G2 - SUCCESS](https://www.tonymacx86.com/threads/hp-elitedesk-800-g2-hp-prodesk-600-g2-success.261452/)
