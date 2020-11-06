# HP EliteDesk 800 G2 Tower PC (Skylake) for macOS Mojave

# Table of Contents

<!-- MarkdownTOC -->

- [hardware specs](#hardware-specs)
- [directory structure](#directory-structure)
- [2.36 Bios Update](#236-bios-update)
- [DSDT patching \(active patches\)](#dsdt-patching-active-patches)
    - [`DSDT.dsl`](#dsdtdsl)
    - [`patches.elitedesk800.clover/SSDT-XOSI.dsl`](#patcheselitedesk800cloverssdt-xosidsl)
    - [`patches.elitedesk800.clover/SSDT-RMCF.dsl`](#patcheselitedesk800cloverssdt-rmcfdsl)
    - [`patches.elitedesk800.clover/SSDT-PTSWAK.dsl`](#patcheselitedesk800cloverssdt-ptswakdsl)
    - [`patches.elitedesk800.clover/SSDT-GPRW.dsl`](#patcheselitedesk800cloverssdt-gprwdsl)
    - [`patches.elitedesk800.clover/SSDT-RMDT.dsl`](#patcheselitedesk800cloverssdt-rmdtdsl)
    - [`patches.elitedesk800.clover/SSDT-DMAC.dsl`](#patcheselitedesk800cloverssdt-dmacdsl)
    - [`patches.elitedesk800.clover/SSDT-HPET.dsl`](#patcheselitedesk800cloverssdt-hpetdsl)
    - [`patches.elitedesk800.clover/SSDT-MEM2.dsl`](#patcheselitedesk800cloverssdt-mem2dsl)
    - [`patches.elitedesk800.clover/SSDT-PMCR.dsl`](#patcheselitedesk800cloverssdt-pmcrdsl)
    - [`patches.elitedesk800.clover/SSDT-LPC.dsl`](#patcheselitedesk800cloverssdt-lpcdsl)
- [DSDT patching \(retired patches\)](#dsdt-patching-retired-patches)
    - [~~`patches.elitedesk800.clover/SSDT-EC.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-ecdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-USBX.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-usbxdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-UIAC.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-uiacdsl%7E%7E)
- [`Clover installation (before Catalina)`](#clover-installation-before-catalina)
- [`Clover installation` **February 2020 / Catalina**](#clover-installation-february-2020--catalina)
- [`Clover Config`](#clover-config)
    - [`ACPI`](#acpi)
    - [`ACPI`](#acpi-1)
    - [`CPU`](#cpu)
    - [`Devices`](#devices)
    - [`GUI`](#gui)
    - [`Graphics`](#graphics)
    - [`KernelAndKextPatches`](#kernelandkextpatches)
    - [`RtVariables`](#rtvariables)
    - [`SMBIOS`](#smbios)
    - [`SystemParameters`](#systemparameters)
- [`kexts`](#kexts)
    - [Power Management](#power-management)
    - [`AppleIntelInfo.kext`](#appleintelinfokext)
- [Check disks with `smartclt`](#check-disks-with-smartclt)
- [`patches.elitedesk800.clover` DSDT hotpatches](#patcheselitedesk800clover-dsdt-hotpatches)

<!-- /MarkdownTOC -->

<!--
* This line is a placeholder to generate the table of contents in jekyll
{:toc}

[TOC]
-->

# hardware specs
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

# directory structure
[up up up](#)

define a `HACK` environment variable for all your hackintosh work. Add `$HACK/bin` for all the hack binaries.

readme:

* `$HACK/wks/DETAILS.clover.md` *very detailed technical details on how to patch a EliteDesk-800*
* `$HACK/wks/README.md` *github readme*
* `$HACK/wks/CHANGELOG.md` *github changelog*
* `$HACK/wks/ENVIRONMENT.wks.md` *my environment to work with hackintoshes*


patches:

* `$HACK/wks/patches.elitedesk800.clover` work in progress directory with all required patches for EliteDesk-800: *DSDT.DSL, SSDT\*.DSL, hotfixes, config.plist*

`$HACK/wks/sources.clover`:

* `$HACK/wks/sources.clover/ACPI.hp.bios.2.36.zip` *ACPI tables from 2.36 BIOS extracted using Clover F4*
* `$HACK/wks/sources.clover/elitedeks800.baseline.20190104.zip` *EliteDesk-800 working hackintosh EFI and kexts on December 2018 10.13.x and initial tries in 10.14.x*
* `$HACK/wks/sources.clover/elitedeks800.debug.20181117.zip` *EliteDesk-800 working hackintosh EFI and kexts on November 2018 10.13.x*
* `$HACK/wks/sources.clover/SP90164.BIOS.N01.236.zip` *Bios 2.36*
* `$HACK/air/sources.clover/miguel41.EFI.catalina.zip` *EFI from tonymac supporting catalina*
* `$HACK/air/sources.clover/OcQuirks Rev 15 - Designare Z390.zip` *Provider for CLOVER/drivers/UEFI*
* `$HACK/air/sources.clover/Catalina Fresh Install.zip` *Provider for CLOVER/drivers/UEFI*
* `$HACK/air/sources.clover/AppleSupport-2.0.9-RELEASE.zip` *Provider for CLOVER/drivers/UEFI FileVault*
* `$HACK/wks/sources.clover/kexts` *updated list with source kexts used*
* `$HACK/wks/release` *the latest released files*

# 2.36 Bios Update
[up up up](#)

I downloaded the 2.36 Bios from [HP](http://support.hp.com/us-en/product/hp-elitedesk-800-g2-tower-pc/7633297/drivers)

* `sp90164`: HP EliteDesk 800 G2 TWR/SFF SystemBIOS (N01) / 02.36 Rev.A / Aug 13, 2018

> Note: Update the BIOS from the BIOS itself. On the CLOVER USB stick place all bios files in *EFI/HP/BIOS/new*. On Finder create an extra EFI directory under the mounted EFI exactly as Clover do.

# DSDT patching (active patches)
[up up up](#)

## `DSDT.dsl`
[up up up](#)

open with MaciASL the `patches.elitedesk800.clover/DSDT.dsl`. In the preferences use the `ACPI 6.2a` and try to compile. If you have only warnings you are good to proceed.

Because we are hotpatching here you should not use the `DSDT.aml` in the clover directory. If you need to use it for debugging purposes then you need to put it in `CLOVER/ACPI/patched` and check the clover setting `config.plist/ACPI/DSDT/Fixes/FixRegions=true)` to fix the *Floating Regions* as described in [Rehabman's guide](https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/)

## `patches.elitedesk800.clover/SSDT-XOSI.dsl`
[up up up](#)

copy `cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-XOSI.dsl patches.air/SSDT-XOSI.dsl` and edit `patches.air/SSDT-XOSI.dsl`

apply clover renames (OSIN first because there is some type of bug on the DSDT patching when applying only the second one):

* change OSIN to XSIN (SSDT-XOSI.dsl) `T1NJTg==` to `WFNJTg==`
* change _OSI to XOSI (SSDT-XOSI.dsl) `X09TSQ==` to `WE9TSQ==`

This XOSI simulates "Windows 2015" (which is Windows 10)

## `patches.elitedesk800.clover/SSDT-RMCF.dsl`
[up up up](#)

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-RMCF.dsl patches.elitedesk800.clover/SSDT-RMCF.dsl` and edit it uaccording to the readme

## `patches.elitedesk800.clover/SSDT-PTSWAK.dsl`
[up up up](#)

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-PTSWAK.dsl patches.elitedesk800.clover/SSDT-PTSWAK.dsl`

Overriding _PTS and _WAK. There is no discrete card in *EliteDesk-800*. However this is known from the `SSDT-RMCF.dsl` and you do not make any changes.

apply clover renames:

* change Method(_PTS,1,N) to ZPTS (SSDT-PTSWAK.dsl) `X1BUUwE=` to `WlBUUwE=`
* change Method(_WAK,1,S) to ZWAK (SSDT-PTSWAK.dsl) `X1dBSwk=` to `WldBSwk=`

## `patches.elitedesk800.clover/SSDT-GPRW.dsl`
[up up up](#)

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-GPRW.dsl patches.elitedesk800.clover/SSDT-GPRW.dsl`

For solving instant wake by hooking GPRW

apply clover renames:

* change Method(GPRW,2,N) to XPRW (SSDT-GPRW.dsl) `R1BSVwI=` to `WFBSVwI=`

## `patches.elitedesk800.clover/SSDT-RMDT.dsl`
[up up up](#)

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-RMDT.dsl patches.elitedesk800.clover/SSDT-RMDT.dsl`

Facility for writing trace output to system.log, Use in conjunction with ACPIDebug.kext

## `patches.elitedesk800.clover/SSDT-DMAC.dsl`
[up up up](#)

Add missing DMAC Device to enhace performance like a real Mac. Inspired by [syscl](https://github.com/syscl/XPS9350-macOS/tree/master/DSDT/patches).

## `patches.elitedesk800.clover/SSDT-HPET.dsl`
[up up up](#)

Disable HPET device by passing value 0 to HPTE to to behave more like a real Mac.

> updated 20190718 (from daliansky/XiaoMi-Pro-Hackintosh repository)

## `patches.elitedesk800.clover/SSDT-MEM2.dsl`
[up up up](#)

Add missing MEM2 Device to enhace performance like a real Mac. Inspired by [syscl](https://github.com/syscl/XPS9350-macOS/tree/master/DSDT/patches).

> updated 20190718 (from daliansky/XiaoMi-Pro-Hackintosh repository)

## `patches.elitedesk800.clover/SSDT-PMCR.dsl`
[up up up](#)

Add missing PMCR Device to enhace performance like a real Mac. Inspired by [syscl](https://github.com/syscl/XPS9350-macOS/tree/master/DSDT/patches). (PPMC and PMCR combine together for macOS to load LPCB correctly).

> updated 20190718 (from daliansky/XiaoMi-Pro-Hackintosh repository)

## `patches.elitedesk800.clover/SSDT-LPC.dsl`
[up up up](#)

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-LPC.dsl patches.elitedesk800.clover/SSDT-LPC.dsl`

To fix unsupported 8-series LPC devices. looked in ioreg and look for LPC. mine is 0x9d48 which is included here

# DSDT patching (retired patches)
[up up up](#)

## ~~`patches.elitedesk800.clover/SSDT-EC.dsl`~~
[up up up](#)

**February 2019**: after looking the DSDT.dsl it turns out that there is an `EC0`. So I applied the EC0 to EC rename patch in the config.plist

according to this [article](https://www.tonymacx86.com/threads/guide-usb-power-property-injection-for-sierra-and-later.222266/) we do not need this so leave it in but keep it. There is an EC0 device but do not rename it. Instead inject the USBX

> article](https://www.tonymacx86.com/threads/guide-usb-power-property-injection-for-sierra-and-later.222266/) Note: If your computer has an ECDT in ACPI, you should not rename anything along the EC path, including the EC itself. Use a "Fake EC" instead as described below. You can check if you have ECDT by extracting ACPI with Clover (F4) and checking for ECDT.aml in EFI/Clover/ACPI/origin.

> Note: You may find you have an EC in your DSDT: Device with "Name (_HID, EisaId ("PNP0C09"))", even if it is not active.

## ~~`patches.elitedesk800.clover/SSDT-USBX.dsl`~~
[up up up](#)

**February 2019**: This is done now using the codeless kext `USBPorts.kext` produced from the Hackingtool

This has the `USBX` device for the power injection according to the [article](https://www.tonymacx86.com/threads/guide-usb-power-property-injection-for-sierra-and-later.222266/)

## ~~`patches.elitedesk800.clover/SSDT-UIAC.dsl`~~
[up up up](#)

**February 2019**: This is done now using the codeless kext `USBPorts.kext` produced from the Hackingtool

The following ports are **disabled** . Check [SSDT-UIAC.dsl](patches.elitedesk800.clover/SSDT-UIAC.dsl) for more information on patching

* USB back, bottom row, 1rst from left
* USB back, bottom row, 2nd from left
* USB back, bottom row, 3rd from left
* USB back, bottom row, 4rth from left


# `Clover installation (before Catalina)`
[up up up](#)

~~I have read in many places including [here](https://www.tonymacx86.com/threads/guide-hp-elite-8300-hp-6300-pro-using-clover-uefi-hotpatch.265384/) that RehabMan's clover fork is more stable so this is the one we are going to use.~~ **July 2019 update:** I switched to latest official all other repositories have being doing this

Regarding the drivers used some of them where from the clover distribution and some of them are forks from [acidanthera](https://github.com/acidanthera) github repository. More specifically I have used:

* `AptioInputFix.efi` from [acidanthera/AptioFixPkg](https://github.com/acidanthera/AptioFixPkg/releases) `AptioFix-R27-RELEASE.zip`
* `AptioMemoryFix.efi` from [acidanthera/AptioFixPkg](https://github.com/acidanthera/AptioFixPkg/releases) `AptioFix-R27-RELEASE.zip`
* `ApfsDriverLoader.efi` from [acidanthera/AppleSupportPkg](https://github.com/acidanthera/AppleSupportPkg) `AppleSupport-v2.0.8-RELEASE.zip`
* `AppleUiSupport.efi` from [acidanthera/AppleSupportPkg](https://github.com/acidanthera/AppleSupportPkg) `AppleSupport-v2.0.8-RELEASE.zip`

> Regarding `AptioInputFix.efi` and `AptioMemoryFix.efi` these are being used in [XiaoMi-Pro-Hackintosh](https://github.com/daliansky/XiaoMi-Pro-Hackintosh) and it noted in [Which OsxAptioFixDrv (1, 2, or 3) do I use for my Coffee Lake hack?](https://www.reddit.com/r/hackintosh/comments/7r752l/which_osxaptiofixdrv_1_2_or_3_do_i_use_for_my/) that 'Probably also worthwhile to look at vit9696's AptioFixPkg as well, as that's made some serious progress toward native NVRAM on Skylake+ hardware (among other things).'

> Regarding `ApfsDriverLoader.efi` and `AppleUiSupport.efi` these are being used in [XiaoMi-Pro-Hackintosh](https://github.com/daliansky/XiaoMi-Pro-Hackintosh) and it noted in [Possible to get FileVault boot drive encryption working on old MSI P67A-C45 motherboard Intel P67 chipset?](https://www.reddit.com/r/hackintosh/comments/a5yxl9/possible_to_get_filevault_boot_drive_encryption/) that 'OsxAptioFixDrv/etc are general drivers that fix a variety of Aptio issues when booting macOS; FileVault is out of their scope (they mainly fix memory mapping issues that prevent boot.efi from loading the kernel). Unless you are running TianoCore-based FW or something special, you will always need some driver for fixing Aptio issues. For a general Aptio firmware fix, just use AptioMemoryFix. There is no point in using anything else (especially on older hardware). You should also use the latest Clover (who knows how old UniBeast's version is).For FV2 support, you need AppleUiSupport from AppleSupportPkg and an input driver. For input, you should either use AptioInputFix (part of AptioFixPkg or UsbKbDxe (also from AppleSupportPkg; you may need additional workarounds to disconnect existing USB keyboard drivers; here is a build with this workaround enabled).'

* `HFSPlus.efi` *from an external source*
* `VirtualSmc.efi` *from VirtualSMC (1.0.6)*

*Clover for UEFI booting only*, *Install Clover in the ESP*

*UEFI Drivers* / *Reccomended Drivers*:

* `AudioDxe.efi`
* `DataHubDxe.efi`
* `FSInject.efi`

*UEFI Drivers* / *FileVault 2 UEFI Drivers* :

* `AppleKeyFeeder.efi`

*Install Clover Preference Pane*

> make sure that in `EFI/CLOVER/drivers/UEFI` you have only the following files: `AppleKeyFeeder.efi`, `AudioDxe.efi`, `DataHubDxe.efi`, `FSInject.efi`. Erase the rest (Clover installer sometimes installs other dependencies)

# `Clover installation` **February 2020 / Catalina**
[up up up](#)

Run `Clover_v2.5k_r5103` installer:

*Continue* > *Continue* > *Change Install Location* > *Install macOS Catalina* > *Customize*

*Clover for UEFI booting only*, *Install Clover in the ESP*

*Install RC scripts on target volume* **Only on the hard disk for NVRAM emulation**

*Install Clover Preference Pane* **Only on the hard disk**

> Create `EFI/CLOVER/drivers/UEFI` or Erase all files in `EFI/CLOVER/drivers/UEFI` if exitsts and copy the ones from the release directory

`EFI/CLOVER/drivers/UEFI` will have the following:

* ApfsDriverLoader.efi
* AppleGenericInput.efi
* AppleUiSupport.efi
* AudioDxe.efi
* EmuVariableUefi.efi
* FwRuntimeServices.efi
* HFSPlus.efi
* OcQuirks.efi
* OcQuirks.plist
* UsbKbDxe.efi
* UsbMouseDxe.efi
* VirtualSmc.efi

These files come from:

* [Designare Z390](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300). Use the `OcQuirks Rev 15 - Designare Z390.zip` and `Catalina Fresh Install.zip`
* [Filevault](https://fewtarius.gitbook.io/laptopguide/extras/enabling-filevault). Use the `AppleSupport-2.0.9-RELEASE.zip`


# `Clover Config`
[up up up](#)

In general I prefer the Clover Configurator although it it not reccomended

## `ACPI`
[up up up](#)

* `AutoMerge > YES`
* `FixHeaders > YES`

* `DSDT > DropOEM_DSM > NO`

* `DSDT > Fixes > AddDTGP > YES`
* `DSDT > Fixes > AddMCHC > YES`
* `DSDT > Fixes > FixADP1 > YES`
* `DSDT > Fixes > FixTMR > YES`
* `DSDT > Fixes > FixRTC > YES`
* `DSDT > Fixes > FixHPET > YES`
* `DSDT > Fixes > FixIPIC > YES`
* `DSDT > Fixes > FixRegions > YES` *only when using custom DSDT.aml*

* `DSDT > Patches`

```xml
<key>Patches</key>
<array>
<dict>
    <key>Comment</key> <string>change OSIN to XSIN (SSDT-XOSI.dsl)</string>
    <key>Find</key> <data>T1NJTg==</data>
    <key>Replace</key> <data>WFNJTg==</data>
</dict>
<dict>
    <key>Comment</key> <string>change _OSI to XOSI (SSDT-XOSI.dsl)</string>
    <key>Find</key> <data>X09TSQ==</data>
    <key>Replace</key> <data>WE9TSQ==</data>
</dict>
<dict>
    <key>Comment</key> <string>change _DSM to XDSM</string>
    <key>Find</key> <data>X0RTTQ==</data>
    <key>Replace</key> <data>WERTTQ==</data>
</dict>
<dict>
    <key>Comment</key> <string>change SAT0 to SATA (SSDT-SMBUS.dsl)</string>
    <key>Find</key> <data>U0FUMA==</data>
    <key>Replace</key> <data>U0FUQQ==</data>
</dict>
<dict>
    <key>Comment</key> <string>change Method(GPRW,2,N) to XPRW (SSDT-GPRW.dsl)</string>
    <key>Find</key> <data>R1BSVwI=</data>
    <key>Replace</key> <data>WFBSVwI=</data>
</dict>
<dict>
    <key>Comment</key> <string>change EC0 to EC (USB Related)</string>
    <key>Find</key> <data>RUMwXw==</data>
    <key>Replace</key> <data>RUNfXw==</data>
</dict>
</array>
```

**July 2019**: The following have been retired since WhatEverGreen is doing them [Intel® HD Graphics FAQ](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md)

```xml
<dict>
    <key>Disabled</key>
    <true/>
    <key>Comment</key> <string>change HDAS to HDEF</string>
    <key>Find</key> <data>SERBUw==</data>
    <key>Replace</key> <data>SERFRg==</data>
</dict>
<dict>
    <key>Disabled</key>
    <true/>
    <key>Comment</key> <string>change HECI to IMEI</string>
    <key>Find</key> <data>SEVDSQ==</data>
    <key>Replace</key> <data>SU1FSQ==</data>
</dict>
<dict>
    <key>Disabled</key>
    <true/>
    <key>Comment</key> <string>change GFX0 to IGPU</string>
    <key>Find</key> <data>R0ZYMA==</data>
    <key>Replace</key> <data>SUdQVQ==</data>
</dict>
```


* `DropTables > Signature > DMAR`

* `SSDT > DropOem > No`
* `SSDT > Generate > PluginType > YES`
* `SSDT > NoOemTableId > NO`

## `ACPI`
[up up up](#)

* `Arguments > -liludbg -wegdbg -igfxdump -igfxfbdump dart=0 -igfxnohdmi gfxrst=1 agdpmod=vit9696 -cdfon -v` *for Lilu/WhateverGreen debugging*
* `Arguments > dart=0 -igfxnohdmi igfxrst=1 agdpmod=vit9696 -cdfon -v`
* `DefaultVolume > LastBootedVolume`
* `HibernationFixup > YES`
* `Legacy > PBR`
* `NeverHibernate > NO`
* `NoEarlyProgress > YES`
* `RtcHibernateAware > YES`
* `Secure > NO`
* `Timeout > 4`

## `CPU`
[up up up](#)

* `HWPEnable > YES` *this apply only in skylake architecture*
* `UseARTFrequency > NO` *do not pass any specific arguments*

## `Devices`
[up up up](#)

* `Audio > Inject > NO`

* `USB > AddClockID > YES`
* `USB > FixOwnership > YES`
* `USB > Inject > NO`

* `$HACK/bin/gfxutil -f HDEF` - `Properties > PciRoot(0x0)/Pci(0x1f,0x3)`

```xml
<key>PciRoot(0x0)/Pci(0x1f,0x3)</key>
<dict>
   <key>AAPL,slot-name</key>
   <string>Internal</string>
   <key>hda-gfx</key>
   <string>onboard-1</string>
   <key>hda-idle-support</key>
   <string>1</string>
   <key>layout-id</key>
   <integer>11</integer>
   <key>model</key>
   <string>Realtek ALC221 Audio Controller</string>
</dict>
```

* `$HACK/bin/gfxutil -f IGPU` - `Properties > DevicePath = PciRoot(0x0)/Pci(0x2,0x0)`

```xml
<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
<dict>
    <key>AAPL,ig-platform-id</key>
    <data>AAASGQ==</data>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device-id</key>
    <data>EhkAAA==</data>
    <key>framebuffer-con0-busid</key>
    <data>BQAAAA==</data>
    <key>framebuffer-con0-enable</key>
    <data>AQAAAA==</data>
    <key>framebuffer-con0-flags</key>
    <data>hwEAAA==</data>
    <key>framebuffer-con0-index</key>
    <data>AQAAAA==</data>
    <key>framebuffer-con0-pipe</key>
    <data>CQAAAA==</data>
    <key>framebuffer-con0-type</key>
    <data>AAQAAA==</data>
    <key>framebuffer-con1-busid</key>
    <data>BgAAAA==</data>
    <key>framebuffer-con1-enable</key>
    <data>AQAAAA==</data>
    <key>framebuffer-con1-index</key>
    <data>AgAAAA==</data>
    <key>framebuffer-con1-pipe</key>
    <data>CgAAAA==</data>
    <key>framebuffer-con2-enable</key>
    <data>AQAAAA==</data>
    <key>framebuffer-con2-index</key>
    <data>AwAAAA==</data>
    <key>framebuffer-con3-busid</key>
    <data>AAAAAA==</data>
    <key>framebuffer-con3-enable</key>
    <data>AQAAAA==</data>
    <key>framebuffer-con3-flags</key>
    <data>IAAAAA==</data>
    <key>framebuffer-con3-index</key>
    <data>/////w==</data>
    <key>framebuffer-con3-pipe</key>
    <data>AAAAAA==</data>
    <key>framebuffer-con3-type</key>
    <data>AQAAAA==</data>
    <key>framebuffer-patch-enable</key>
    <data>AQAAAA==</data>
    <key>hda-gfx</key>
    <string>onboard-1</string>
</dict>
```

additional devices have been added from the Hackingtool/PCItab and exported

```xml
<key>PciRoot(0x0)/Pci(0x0,0x0)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>Host bridge</string>
    <key>model</key>
    <string>Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers</string>
</dict>
<key>PciRoot(0x0)/Pci(0x14,0x0)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>USB controller</string>
    <key>model</key>
    <string>100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller</string>
</dict>
<key>PciRoot(0x0)/Pci(0x14,0x2)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>Signal processing controller</string>
    <key>model</key>
    <string>100 Series/C230 Series Chipset Family Thermal Subsystem</string>
</dict>
<key>PciRoot(0x0)/Pci(0x17,0x0)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>SATA controller</string>
    <key>model</key>
    <string>Q170/Q150/B150/H170/H110/Z170/CM236 Chipset SATA Controller [AHCI Mode]</string>
</dict>
<key>PciRoot(0x0)/Pci(0x1f,0x0)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>ISA bridge</string>
    <key>model</key>
    <string>Q170 Chipset LPC/eSPI Controller</string>
</dict>
<key>PciRoot(0x0)/Pci(0x1f,0x2)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>Memory controller</string>
    <key>model</key>
    <string>100 Series/C230 Series Chipset Family Power Management Controller</string>
</dict>
<key>PciRoot(0x0)/Pci(0x1f,0x4)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>SMBus</string>
    <key>model</key>
    <string>100 Series/C230 Series Chipset Family SMBus</string>
</dict>
<key>PciRoot(0x0)/Pci(0x1f,0x6)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal</string>
    <key>device_type</key>
    <string>Ethernet controller</string>
    <key>model</key>
    <string>Ethernet Connection (2) I219-LM</string>
</dict>
```

## `GUI`
[up up up](#)

```xml
<key>GUI</key>
<dict>
    <key>Hide</key>
    <array>
        <string>Preboot</string>
        <string>Recovery</string>
    </array>
    <key>Mouse</key>
    <dict>
        <key>Enabled</key>
        <false/>
    </dict>
    <key>Scan</key>
    <dict>
        <key>Entries</key>
        <true/>
        <key>Legacy</key>
        <false/>
        <key>Linux</key>
        <true/>
        <key>Tool</key>
        <true/>
    </dict>
    <key>ScreenResolution</key>
    <string>1920x1080</string>
    <key>Theme</key>
    <string>embedded</string>
</dict>
```

## `Graphics`
[up up up](#)

```xml
<key>Graphics</key>
<dict>
    <key>EDID</key>
    <dict>
        <key>Inject</key>
        <true/>
    </dict>
    <key>Inject</key>
    <dict>
        <key>ATI</key>
        <false/>
        <key>Intel</key>
        <false/>
        <key>NVidia</key>
        <false/>
    </dict>
</dict>
```

## `KernelAndKextPatches`
[up up up](#)

```xml
<key>KernelPm</key> <true/>
<key>AppleRTC</key> <true/>
<key>KernelXCPM</key> <true/>
```

```xml
<key>KernelToPatch</key>
<array>
    <dict>
        <key>Comment</key>
        <string>MSR 0xE2 _xcpm_idle instant reboot(c) Pike R. Alpha</string>
        <key>Find</key>
        <data>ILniAAAADzA=</data>
        <key>Replace</key>
        <data>ILniAAAAkJA=</data>
    </dict>
    <dict>
        <key>Comment</key>
        <string>Disable panic kext logging on 10.13 release kernel (credit vit9696)</string>
        <key>Find</key>
        <data>igKEwHRE</data>
        <key>MatchOS</key>
        <string>10.13.x</string>
        <key>Replace</key>
        <data>igKEwOtE</data>
    </dict>
    <dict>
        <key>Comment</key>
        <string>Disable panic kext logging on 10.14 release kernel (credit vit9696)</string>
        <key>Find</key>
        <data>igKEwHRC</data>
        <key>MatchOS</key>
        <string>10.14.x</string>
        <key>Replace</key>
        <data>igKEwOtC</data>
    </dict>
</array>
```

```xml
<key>KextsToPatch</key>
<array>
    <dict>
        <key>Comment</key>
        <string>Enable TRIM for SSD</string>
        <key>Find</key>
        <data>AEFQUExFIFNTRAA=</data>
        <key>InfoPlistPatch</key>
        <false/>
        <key>Name</key>
        <string>com.apple.iokit.IOAHCIBlockStorage</string>
        <key>Replace</key>
        <data>AAAAAAAAAAAAAAA=</data>
    </dict>
</array>
```

## `RtVariables`
[up up up](#)

```xml
<key>RtVariables</key>
<dict>
    <key>BooterConfig</key>
    <string>0x28</string>
    <key>CsrActiveConfig</key>
    <string>0x67</string>
    <key>ROM</key>
    <string>UseMacAddr0</string>
</dict>
```

## `SMBIOS`
[up up up](#)

**MacBookPro17,1**

## `SystemParameters`
[up up up](#)

```xml
<key>SystemParameters</key>
<dict>
    <key>InjectKexts</key>
    <string>YES</string>
    <key>InjectSystemID</key>
    <true/>
</dict>
```

On a USB Flash Drive recover:

If placed kexts on `/L/E` then:

```xml
<key>SystemParameters</key>
<dict>
    <key>InjectKexts</key>
    <string>Detect</string>
    <key>InjectSystemID</key>
    <true/>
</dict>
```

If placed kexts on `EFI/CLOVER/kexts/Other` then:

```xml
<key>SystemParameters</key>
<dict>
    <key>InjectKexts</key>
    <string>YES</string>
    <key>InjectSystemID</key>
    <true/>
</dict>
```

# `kexts`
[up up up](#)

used

* `Clover_v2.5k_r50103.pkg` - `From Official Site`
* `as.vit9696.VirtualSMC (1.0.6)`  - `VirtualSMC.1.0.6.RELEASE.zip` **use only main kext**
* `com.rehabman.driver.ACPIDebug (0.1.4)` - `RehabMan-Debug-2015-1230.zip`
* `as.vit9696.Lilu (1.3.7)` - `Lilu.1.3.7.RELEASE.zip`
* `as.vit9696.WhateverGreen (1.3.0)` - `WhateverGreen.1.3.0.RELEASE.zip`
* `as.lvs1974.HibernationFixup (1.2.6)` - `HibernationFixup.1.2.6.RELEASE.zip`
* `as.vit9696.AppleALC (1.3.9)` - `AppleALC.1.3.9.RELEASE.zip`
* `org.tw.CodecCommander (2.7.1)` - `RehabMan-CodecCommander-2018-1003.zip`
* `AppleIntelInfo.kext` - [Replacement for AppleIntelCPUPowerManagementInfo.kext](https://github.com/Piker-Alpha/AppleIntelInfo)
* `SATA-unsupported.kext` *from [RehabMan/hack-tools](https://github.com/RehabMan/hack-tools/tree/master/kexts)*
* `LiluFriend.kext` - `LiluFriend.1.1.0.RELEASE.zip`
* `LiluFriendLite.kext` - *from [RehabMan/hack-tools](https://github.com/RehabMan/hack-tools/tree/master/template_kexts)*
* `com.rehabman.driver.USBInjectAll (0.7.1)` - `RehabMan-USBInjectAll-2018-1108.zip`

* `Clover_v2.5k_r50103.pkg` - `From [Github](https://github.com/CloverHackyColor/CloverBootloader/releases) Site`
* `as.vit9696.VirtualSMC (1.0.9)`  - `VirtualSMC-1.0.9-RELEASE.zip` **used VirtualSMC.kext and SMCBatteryManager.kext**
* `com.rehabman.driver.ACPIDebug (0.1.4)` - `RehabMan-Debug-2015-1230.zip`
* `s.vit9696.Lilu (1.4.1)` - `Lilu-1.4.1-RELEASE.zip`
* `as.vit9696.WhateverGreen (1.3.6)` - `WhateverGreen-1.3.6-RELEASE.zip`
* `as.lvs1974.HibernationFixup (1.3.2)` - `HibernationFixup-1.3.2-RELEASE.zip`
* `as.vit9696.AppleALC (1.4.6)` - `AppleALC-1.4.6-RELEASE.zip`
* `org.tw.CodecCommander (2.7.1)` - `RehabMan-CodecCommander-2018-1003.zip`
* ~~`com.insanelymac.IntelMausiEthernet (2.4.1d1)` - `RehabMan-IntelMausiEthernet-v2-2018-1031.zip`~~
* `as.acidanthera.mieze.IntelMausi (1.0.2)` -- `IntelMausi-1.0.2-RELEASE.zip`
* `AppleIntelInfo.kext` - [Replacement for AppleIntelCPUPowerManagementInfo.kext](https://github.com/Piker-Alpha/AppleIntelInfo)
* `SATA-unsupported.kext` *from [RehabMan/hack-tools](https://github.com/RehabMan/hack-tools/tree/master/kexts)*
* `USBPorts.kext` created with [FB-Patcher](https://www.insanelymac.com/forum/topic/335018-intel-fb-patcher-v168/) very similar to the procedure from Rehabman's USBInjectAll
* `LiluFriend.kext` - `LiluFriend.1.1.0.RELEASE.zip`
* `LiluFriendLite.kext` - `LiluFriendLite.kext.zip`
* ~~`com.rehabman.driver.USBInjectAll (0.7.1)` - `RehabMan-USBInjectAll-2018-1108.zip`~~

## Power Management
[up up up](#)

consult [this link](https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/)

stock settings

```shell
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

**I did not do any edits you could try**

```shell
$ sudo pmset -a hibernatemode 0
$ sudo rm /var/vm/sleepimage
$ sudo mkdir /var/vm/sleepimage
$ sudo pmset -a standby 0
$ sudo pmset -a autopoweroff 0
$ sudo pmset -g
System-wide power settings:
Currently in use:
 standby              0
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
 hibernatemode        0
 autopoweroff         0
 ttyskeepawake        1
 displaysleep         0
 highstandbythreshold 50
 standbydelaylow      0
```

## `AppleIntelInfo.kext`
[up up up](#)

In order to log logCStates, logIGPU, logIPGStyle, logIntelRegs, logMSRs

Also on PowerManagement Rehabman has a great [guide](https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/)

```bash
cd git
git clone https://github.com/Piker-Alpha/AppleIntelInfo.git AppleIntelInfo.git
open AppleIntelInfo.xcodeproj
Product > Build
Product > Build For > Running
get it from
~/Library/Developer/Xcode/DerivedData/AppleIntelInfo-foszpapuujmtjtcxjpclaslwzafu/Build/Products/Debug/AppleIntelInfo.kext/
sudo chown -R root:wheel AppleIntelInfo.kext
sudo chmod -R 755 AppleIntelInfo.kext
sudo kextload AppleIntelInfo.kext
sudo kextunload AppleIntelInfo.kext
sudo cat /tmp/AppleIntelInfo.dat
```

# Check disks with `smartclt`
[up up up](#)

**500GB Samsung V-NAND SSD 860 EVO MZ-76E500 (Model Code: MZ-76E500B/EU)**

```shell_session
$ smartctl -a disk1
smartctl 7.1 2019-12-30 r5022 [Darwin 19.3.0 x86_64] (local build)
Copyright (C) 2002-19, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Family:     Samsung based SSDs
Device Model:     Samsung SSD 860 EVO 500GB
Serial Number:    S4XBNF0M837946E
LU WWN Device Id: 5 002538 e4984a61c
Firmware Version: RVT03B6Q
User Capacity:    500,107,862,016 bytes [500 GB]
Sector Size:      512 bytes logical/physical
Rotation Rate:    Solid State Device
Form Factor:      2.5 inches
Device is:        In smartctl database [for details use: -P show]
ATA Version is:   ACS-4 T13/BSR INCITS 529 revision 5
SATA Version is:  SATA 3.2, 6.0 Gb/s (current: 6.0 Gb/s)
Local Time is:    Thu Feb 27 11:04:28 2020 EET
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

General SMART Values:
Offline data collection status:  (0x00) Offline data collection activity
                    was never started.
                    Auto Offline Data Collection: Disabled.
Self-test execution status:      (   0) The previous self-test routine completed
                    without error or no self-test has ever
                    been run.
Total time to complete Offline
data collection:        (    0) seconds.
Offline data collection
capabilities:            (0x53) SMART execute Offline immediate.
                    Auto Offline data collection on/off support.
                    Suspend Offline collection upon new
                    command.
                    No Offline surface scan supported.
                    Self-test supported.
                    No Conveyance Self-test supported.
                    Selective Self-test supported.
SMART capabilities:            (0x0003) Saves SMART data before entering
                    power-saving mode.
                    Supports SMART auto save timer.
Error logging capability:        (0x01) Error logging supported.
                    General Purpose Logging supported.
Short self-test routine
recommended polling time:    (   2) minutes.
Extended self-test routine
recommended polling time:    (  85) minutes.
SCT capabilities:          (0x003d) SCT Status supported.
                    SCT Error Recovery Control supported.
                    SCT Feature Control supported.
                    SCT Data Table supported.

SMART Attributes Data Structure revision number: 1
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  5 Reallocated_Sector_Ct   0x0033   100   100   010    Pre-fail  Always       -       0
  9 Power_On_Hours          0x0032   099   099   000    Old_age   Always       -       74
 12 Power_Cycle_Count       0x0032   099   099   000    Old_age   Always       -       11
177 Wear_Leveling_Count     0x0013   100   100   000    Pre-fail  Always       -       0
179 Used_Rsvd_Blk_Cnt_Tot   0x0013   100   100   010    Pre-fail  Always       -       0
181 Program_Fail_Cnt_Total  0x0032   100   100   010    Old_age   Always       -       0
182 Erase_Fail_Count_Total  0x0032   100   100   010    Old_age   Always       -       0
183 Runtime_Bad_Block       0x0013   100   100   010    Pre-fail  Always       -       0
187 Uncorrectable_Error_Cnt 0x0032   100   100   000    Old_age   Always       -       0
190 Airflow_Temperature_Cel 0x0032   070   058   000    Old_age   Always       -       30
195 ECC_Error_Rate          0x001a   200   200   000    Old_age   Always       -       0
199 CRC_Error_Count         0x003e   100   100   000    Old_age   Always       -       0
235 POR_Recovery_Count      0x0012   099   099   000    Old_age   Always       -       1
241 Total_LBAs_Written      0x0032   099   099   000    Old_age   Always       -       590175738

SMART Error Log Version: 1
No Errors Logged

SMART Self-test log structure revision number 1
No self-tests have been logged.  [To run self-tests, use: smartctl -t]

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
  256        0    65535  Read_scanning was never started
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.
```

**SanDisk SD7SB3Q-256G-1006**

```shell_session
$ smartctl -a disk0
smartctl 7.0 2018-12-30 r4883 [Darwin 18.2.0 x86_64] (local build)
Copyright (C) 2002-18, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Device Model:     SanDisk SD7SB3Q-256G-1006
Serial Number:    162262400672
LU WWN Device Id: 5 001b44 4a4a7ba2c
Firmware Version: X2180006
User Capacity:    256,060,514,304 bytes [256 GB]
Sector Sizes:     512 bytes logical, 4096 bytes physical
Rotation Rate:    Solid State Device
Form Factor:      2.5 inches
Device is:        Not in smartctl database [for details use: -P showall]
ATA Version is:   ACS-2 T13/2015-D revision 3
SATA Version is:  SATA 3.2, 6.0 Gb/s (current: 6.0 Gb/s)
Local Time is:    Mon Jan 14 11:39:32 2019 EET
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED
See vendor-specific Attribute list for marginal Attributes.

General SMART Values:
Offline data collection status:  (0x82) Offline data collection activity
                    was completed without error.
                    Auto Offline Data Collection: Enabled.
Self-test execution status:      (   0) The previous self-test routine completed
                    without error or no self-test has ever
                    been run.
Total time to complete Offline
data collection:        (  120) seconds.
Offline data collection
capabilities:            (0x5b) SMART execute Offline immediate.
                    Auto Offline data collection on/off support.
                    Suspend Offline collection upon new
                    command.
                    Offline surface scan supported.
                    Self-test supported.
                    No Conveyance Self-test supported.
                    Selective Self-test supported.
SMART capabilities:            (0x0003) Saves SMART data before entering
                    power-saving mode.
                    Supports SMART auto save timer.
Error logging capability:        (0x01) Error logging supported.
                    General Purpose Logging supported.
Short self-test routine
recommended polling time:    (   2) minutes.
Extended self-test routine
recommended polling time:    (  17) minutes.
SCT capabilities:          (0x003d) SCT Status supported.
                    SCT Error Recovery Control supported.
                    SCT Feature Control supported.
                    SCT Data Table supported.

SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x002f   252   252   002    Pre-fail  Always       -       0
  5 Reallocated_Sector_Ct   0x0033   252   252   005    Pre-fail  Always       -       0
  9 Power_On_Hours          0x0032   080   080   ---    Old_age   Always       -       8783
 12 Power_Cycle_Count       0x0032   252   252   ---    Old_age   Always       -       790
170 Unknown_Attribute       0x0033   100   100   010    Pre-fail  Always       -       0
171 Unknown_Attribute       0x0022   100   100   ---    Old_age   Always       -       0
172 Unknown_Attribute       0x0032   100   100   ---    Old_age   Always       -       0
173 Unknown_Attribute       0x0033   098   098   005    Pre-fail  Always       -       373674737670
174 Unknown_Attribute       0x0032   252   252   ---    Old_age   Always       -       415
183 Runtime_Bad_Block       0x0032   100   100   000    Old_age   Always       -       0
184 End-to-End_Error        0x0033   100   100   097    Pre-fail  Always       -       0
187 Reported_Uncorrect      0x0032   100   099   ---    Old_age   Always       -       1
188 Command_Timeout         0x0032   100   098   ---    Old_age   Always       -       31
190 Airflow_Temperature_Cel 0x0022   071   026   045    Old_age   Always   In_the_past 29
196 Reallocated_Event_Count 0x0032   252   252   ---    Old_age   Always       -       0
199 UDMA_CRC_Error_Count    0x0022   100   100   ---    Old_age   Always       -       0
244 Unknown_Attribute       0x0032   000   100   ---    Old_age   Always       -       0

SMART Error Log Version: 1
No Errors Logged

SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed without error       00%         1         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.
```

**Seagate Barracuda 7200.14 ST1000DM003-1SB102**

```shell_session
$ smartctl -a disk1
smartctl 7.0 2018-12-30 r4883 [Darwin 18.2.0 x86_64] (local build)
Copyright (C) 2002-18, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Family:     Seagate Barracuda 7200.14 (AF)
Device Model:     ST1000DM003-1SB102
Serial Number:    W9A3EBP6
LU WWN Device Id: 5 000c50 09c21e777
Firmware Version: HPH3
User Capacity:    1,000,204,886,016 bytes [1.00 TB]
Sector Sizes:     512 bytes logical, 4096 bytes physical
Rotation Rate:    7200 rpm
Form Factor:      3.5 inches
Device is:        In smartctl database [for details use: -P show]
ATA Version is:   ACS-3 T13/2161-D revision 3b
SATA Version is:  SATA 3.1, 6.0 Gb/s (current: 6.0 Gb/s)
Local Time is:    Mon Jan 14 11:40:32 2019 EET
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

General SMART Values:
Offline data collection status:  (0x82) Offline data collection activity
                    was completed without error.
                    Auto Offline Data Collection: Enabled.
Self-test execution status:      (   0) The previous self-test routine completed
                    without error or no self-test has ever
                    been run.
Total time to complete Offline
data collection:        (    0) seconds.
Offline data collection
capabilities:            (0x5b) SMART execute Offline immediate.
                    Auto Offline data collection on/off support.
                    Suspend Offline collection upon new
                    command.
                    Offline surface scan supported.
                    Self-test supported.
                    No Conveyance Self-test supported.
                    Selective Self-test supported.
SMART capabilities:            (0x0003) Saves SMART data before entering
                    power-saving mode.
                    Supports SMART auto save timer.
Error logging capability:        (0x01) Error logging supported.
                    General Purpose Logging supported.
Short self-test routine
recommended polling time:    (   2) minutes.
Extended self-test routine
recommended polling time:    ( 104) minutes.
SCT capabilities:          (0x10bd) SCT Status supported.
                    SCT Error Recovery Control supported.
                    SCT Feature Control supported.
                    SCT Data Table supported.

SMART Attributes Data Structure revision number: 32
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x002f   079   063   006    Pre-fail  Always       -       84755558
  3 Spin_Up_Time            0x0023   097   097   000    Pre-fail  Always       -       0
  4 Start_Stop_Count        0x0032   100   100   000    Old_age   Always       -       818
  5 Reallocated_Sector_Ct   0x0033   100   100   010    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x002f   078   060   030    Pre-fail  Always       -       75723067
  9 Power_On_Hours          0x0032   080   080   000    Old_age   Always       -       17569
 10 Spin_Retry_Count        0x0033   100   100   097    Pre-fail  Always       -       0
 12 Power_Cycle_Count       0x0032   100   100   000    Old_age   Always       -       781
180 Unknown_HDD_Attribute   0x002a   100   100   000    Old_age   Always       -       2098919187
183 Runtime_Bad_Block       0x0032   100   100   000    Old_age   Always       -       0
184 End-to-End_Error        0x0033   100   100   097    Pre-fail  Always       -       0
187 Reported_Uncorrect      0x0032   100   100   000    Old_age   Always       -       0
188 Command_Timeout         0x0032   100   100   000    Old_age   Always       -       0 0 0
189 High_Fly_Writes         0x003a   100   100   000    Old_age   Always       -       0
190 Airflow_Temperature_Cel 0x0022   068   060   040    Old_age   Always       -       32 (Min/Max 31/32)
193 Load_Cycle_Count        0x0032   100   100   000    Old_age   Always       -       1515
194 Temperature_Celsius     0x0022   032   015   000    Old_age   Always       -       32 (0 15 0 0 0)
195 Hardware_ECC_Recovered  0x003a   001   001   000    Old_age   Always       -       84755558
196 Reallocated_Event_Count 0x0032   100   100   000    Old_age   Always       -       0
197 Current_Pending_Sector  0x0032   100   100   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0030   100   100   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x0032   200   200   000    Old_age   Always       -       0

SMART Error Log Version: 1
No Errors Logged

SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed without error       00%         1         -

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.
```

**Western Digital Caviar Green WDC WD10EAVS-14M4B0**

```shell_session
$ smartctl -a disk3
smartctl 7.0 2018-12-30 r4883 [Darwin 18.2.0 x86_64] (local build)
Copyright (C) 2002-18, Bruce Allen, Christian Franke, www.smartmontools.org

=== START OF INFORMATION SECTION ===
Model Family:     Western Digital Caviar Green
Device Model:     WDC WD10EAVS-14M4B0
Serial Number:    WD-WCAV56704480
LU WWN Device Id: 5 0014ee 203e4fbe5
Firmware Version: 01.00A01
User Capacity:    1,000,204,886,016 bytes [1.00 TB]
Sector Size:      512 bytes logical/physical
Rotation Rate:    5400 rpm
Device is:        In smartctl database [for details use: -P show]
ATA Version is:   ATA8-ACS (minor revision not indicated)
SATA Version is:  SATA 2.6, 3.0 Gb/s
Local Time is:    Mon Jan 14 11:43:01 2019 EET
SMART support is: Available - device has SMART capability.
SMART support is: Enabled

=== START OF READ SMART DATA SECTION ===
SMART overall-health self-assessment test result: PASSED

General SMART Values:
Offline data collection status:  (0x00) Offline data collection activity
                    was never started.
                    Auto Offline Data Collection: Disabled.
Self-test execution status:      (   0) The previous self-test routine completed
                    without error or no self-test has ever
                    been run.
Total time to complete Offline
data collection:        (20760) seconds.
Offline data collection
capabilities:            (0x7b) SMART execute Offline immediate.
                    Auto Offline data collection on/off support.
                    Suspend Offline collection upon new
                    command.
                    Offline surface scan supported.
                    Self-test supported.
                    Conveyance Self-test supported.
                    Selective Self-test supported.
SMART capabilities:            (0x0003) Saves SMART data before entering
                    power-saving mode.
                    Supports SMART auto save timer.
Error logging capability:        (0x01) Error logging supported.
                    General Purpose Logging supported.
Short self-test routine
recommended polling time:    (   2) minutes.
Extended self-test routine
recommended polling time:    ( 239) minutes.
Conveyance self-test routine
recommended polling time:    (   5) minutes.
SCT capabilities:          (0x303f) SCT Status supported.
                    SCT Error Recovery Control supported.
                    SCT Feature Control supported.
                    SCT Data Table supported.

SMART Attributes Data Structure revision number: 16
Vendor Specific SMART Attributes with Thresholds:
ID# ATTRIBUTE_NAME          FLAG     VALUE WORST THRESH TYPE      UPDATED  WHEN_FAILED RAW_VALUE
  1 Raw_Read_Error_Rate     0x002f   200   200   051    Pre-fail  Always       -       0
  3 Spin_Up_Time            0x0027   119   107   021    Pre-fail  Always       -       7016
  4 Start_Stop_Count        0x0032   083   083   000    Old_age   Always       -       17368
  5 Reallocated_Sector_Ct   0x0033   200   200   140    Pre-fail  Always       -       0
  7 Seek_Error_Rate         0x002e   100   253   000    Old_age   Always       -       0
  9 Power_On_Hours          0x0032   055   055   000    Old_age   Always       -       33227
 10 Spin_Retry_Count        0x0032   100   100   000    Old_age   Always       -       0
 11 Calibration_Retry_Count 0x0032   100   100   000    Old_age   Always       -       0
 12 Power_Cycle_Count       0x0032   095   095   000    Old_age   Always       -       5716
192 Power-Off_Retract_Count 0x0032   199   199   000    Old_age   Always       -       1085
193 Load_Cycle_Count        0x0032   195   195   000    Old_age   Always       -       16282
194 Temperature_Celsius     0x0022   115   096   000    Old_age   Always       -       32
196 Reallocated_Event_Count 0x0032   200   200   000    Old_age   Always       -       0
197 Current_Pending_Sector  0x0032   200   200   000    Old_age   Always       -       0
198 Offline_Uncorrectable   0x0030   100   253   000    Old_age   Offline      -       0
199 UDMA_CRC_Error_Count    0x0032   200   200   000    Old_age   Always       -       798
200 Multi_Zone_Error_Rate   0x0008   100   253   000    Old_age   Offline      -       0

SMART Error Log Version: 1
No Errors Logged

SMART Self-test log structure revision number 1
No self-tests have been logged.  [To run self-tests, use: smartctl -t]

SMART Selective self-test log data structure revision number 1
 SPAN  MIN_LBA  MAX_LBA  CURRENT_TEST_STATUS
    1        0        0  Not_testing
    2        0        0  Not_testing
    3        0        0  Not_testing
    4        0        0  Not_testing
    5        0        0  Not_testing
Selective self-test flags (0x0):
  After scanning selected spans, do NOT read-scan remainder of disk.
If Selective self-test is pending on power-up, resume after 0 minute delay.
```

[up up up](#)

* sleep [hibernation](https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/) *work in progress (not focus of the guide)*
* check whether this computer is affected by [goodwin/ALCPlugFix](https://github.com/goodwin/ALCPlugFix) *work in progress*
* Audio through DisplayPorts *has not checked and is not the focused of the guide*
* Enable HiDPI resolutions *work in progress*

# `patches.elitedesk800.clover` DSDT hotpatches
[up up up](#)

```
SSDT-DMAC.dsl
SSDT-EC.dsl
SSDT-GPRW.dsl
SSDT-HPET.dsl
SSDT-LPC.dsl
SSDT-MEM2.dsl
SSDT-PMCR.dsl
SSDT-PTSWAK.dsl
SSDT-RMCF.dsl
SSDT-RMDT.dsl
SSDT-SMBUS.dsl
SSDT-UIAC.dsl
SSDT-USBX.dsl
SSDT-XOSI.dsl
```

