# HP EliteDesk 800 G2 Tower PC (Skylake) for macOS Catalina & Big Sur

# Table of Contents

<!-- MarkdownTOC -->

- [hardware specs](#hardware-specs)
- [directory structure](#directory-structure)
- [2.36 Bios Update](#236-bios-update)
- [DSDT patching \(active patches\)](#dsdt-patching-active-patches)
    - [`patches.elitedesk800.opencore/SSDT-PLUG.dsl`](#patcheselitedesk800opencoressdt-plugdsl)
    - [`patches.elitedesk800.opencore/SSDT-EC-USBX.dsl`](#patcheselitedesk800opencoressdt-ec-usbxdsl)
    - [`patches.elitedesk800.opencore/SSDT-HPET.dsl` + OC patches](#patcheselitedesk800opencoressdt-hpetdsl--oc-patches)
    - [`patches.elitedesk800.opencore/SSDT-SBUS-MCHC.dsl`](#patcheselitedesk800opencoressdt-sbus-mchcdsl)
    - [`patches.elitedesk800.opencore/SSDT-USBX.dsl`](#patcheselitedesk800opencoressdt-usbxdsl)
- [DSDT patching \(retired patches\)](#dsdt-patching-retired-patches)
    - [~~`DSDT.dsl`~~](#%7E%7Edsdtdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-XOSI.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-xosidsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-RMCF.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-rmcfdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-PTSWAK.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-ptswakdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-GPRW.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-gprwdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-RMDT.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-rmdtdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-DMAC.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-dmacdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-HPET.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-hpetdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-MEM2.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-mem2dsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-PMCR.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-pmcrdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-LPC.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-lpcdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-EC.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-ecdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-USBX.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-usbxdsl%7E%7E)
    - [~~`patches.elitedesk800.clover/SSDT-UIAC.dsl`~~](#%7E%7Epatcheselitedesk800cloverssdt-uiacdsl%7E%7E)
- [`config.plist`](#configplist)
    - [ACPI](#acpi)
    - [Booter](#booter)
    - [DeviceProperties](#deviceproperties)
    - [Kernel](#kernel)
    - [Misc](#misc)
    - [NVRAM](#nvram)
    - [PlatformInfo](#platforminfo)
    - [UEFI](#uefi)
    - [OpenCore beauty treatment](#opencore-beauty-treatment)
- [How to Debug](#how-to-debug)
- [RTC problems](#rtc-problems)
- [TRIM on SSDs](#trim-on-ssds)
- [Audio](#audio)
- [Ethernet](#ethernet)
- [Graphics](#graphics)
- [USB Mapping](#usb-mapping)
- [Sleep](#sleep)
- [`kexts`](#kexts)
- [Check disks with `smartclt`](#check-disks-with-smartclt)

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

* `$HACK/wks/DETAILS.md` *very detailed technical details on how to patch a EliteDesk-800*
* `$HACK/wks/README.md` *github readme*
* `$HACK/wks/CHANGELOG.md` *github changelog*
* `$HACK/wks/ENVIRONMENT.wks.md` *my environment to work with hackintoshes*

patches:

* `$HACK/wks/patches.elitedesk800.opencore` work in progress directory with all required patches for EliteDesk-800: *DSDT.DSL, SSDT\*.DSL, hotfixes, config.plist*

# 2.36 Bios Update
[up up up](#)

I downloaded the 2.36 Bios from [HP](http://support.hp.com/us-en/product/hp-elitedesk-800-g2-tower-pc/7633297/drivers)

* `sp90164`: HP EliteDesk 800 G2 TWR/SFF SystemBIOS (N01) / 02.36 Rev.A / Aug 13, 2018

> Note: Update the BIOS from the BIOS itself. On the CLOVER USB stick place all bios files in *EFI/HP/BIOS/new*. On Finder create an extra EFI directory under the mounted EFI exactly as Clover do.

# DSDT patching (active patches)
[up up up](#)

## `patches.elitedesk800.opencore/SSDT-PLUG.dsl`
[up up up](#)

[Fixing Power Management (SSDT-PLUG)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html)

## `patches.elitedesk800.opencore/SSDT-EC-USBX.dsl`

[Fixing Embedded Controller (SSDT-EC/USBX)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-fix.html)

Manual > SSDT-EC-USBX.dsl

## `patches.elitedesk800.opencore/SSDT-HPET.dsl` + OC patches

[Fixing IRQ Conflicts (SSDT-HPET + OC_Patches.plist)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/irq.html)

So head over to [SSDT: Easy Way](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-methods/ssdt-easy.html) on how to make it.(use option C to omit conflicting legacy IRQs)

Manual > SSDT-HPET.dsl

and patch

```bash
  #######################################################
 #              Select IRQs To Nullify                 #
#######################################################

Current Legacy IRQs:

 - IPIC: [2]
 - MATH: [13]
 -  RTC: [8]
 - TIMR: [0]
 - PS2K: [1]
 - PS2M: [12, 4, 3, 4, 3, 3, 5, 7, 10, 4, 5, 7, 10, 3, 5, 7, 10, 4, 5, 7, 10, 5, 7, 10, 11, 14, 15, 5, 7, 10, 11, 14, 15, 5, 7, 10, 11, 14, 15, 5, 7, 10, 11, 14, 15, 5, 7, 10, 11, 14, 15, 5, 7, 10, 11, 14, 15]
 - COM1: [0, 0]
 - COM2: [0, 0]
 - LPT1: [0]

C. Only Conflicting IRQs from Legacy Devices (0,8,11 from IPIC/TMR/RTC)
O. Only Conflicting IRQs (0,8,11)
L. Legacy IRQs (from IPIC, TMR/TIMR, and RTC)

You can also type your own list of Devices and IRQs.
The format is DEV1:IRQ1,IRQ2 DEV2:IRQ3,IRQ4
You can omit the IRQ# to remove all from that device (DEV1: DEV2:1,2,3)
For example, to remove IRQ 0 from RTC, all from IPIC, and 8 and 11 from TMR:

RTC:0 IPIC: TMR:8,11

Please select an option (default is C):C
```

```xml
<dict>
    <key>ACPI</key>
    <dict>
        <key>Add</key>
        <array>
            <dict>
                <key>Comment</key>
                <string>HPET _CRS (Needs _CRS to XCRS Rename)</string>
                <key>Enabled</key>
                <true/>
                <key>Path</key>
                <string>SSDT-HPET.aml</string>
            </dict>
        </array>
        <key>Patch</key>
        <array>
            <dict>
                <key>Comment</key>
                <string>HPET _CRS to XCRS Rename (SSDTTime)</string>
                <key>Count</key>
                <integer>0</integer>
                <key>Enabled</key>
                <true/>
                <key>Find</key>
                <data>
                JV9DUlM=
                </data>
                <key>Limit</key>
                <integer>0</integer>
                <key>Mask</key>
                <data>
                </data>
                <key>OemTableId</key>
                <data>
                AAAAAA==
                </data>
                <key>Replace</key>
                <data>
                JVhDUlM=
                </data>
                <key>ReplaceMask</key>
                <data>
                </data>
                <key>Skip</key>
                <integer>0</integer>
                <key>TableLength</key>
                <integer>0</integer>
                <key>TableSignature</key>
                <data>
                AAAAAA==
                </data>
            </dict>
            <dict>
                <key>Comment</key>
                <string>RTC IRQ 8 Patch (SSDTTime)</string>
                <key>Count</key>
                <integer>0</integer>
                <key>Enabled</key>
                <true/>
                <key>Find</key>
                <data>
                IgABeQA=
                </data>
                <key>Limit</key>
                <integer>0</integer>
                <key>Mask</key>
                <data>
                </data>
                <key>OemTableId</key>
                <data>
                AAAAAA==
                </data>
                <key>Replace</key>
                <data>
                IgAAeQA=
                </data>
                <key>ReplaceMask</key>
                <data>
                </data>
                <key>Skip</key>
                <integer>0</integer>
                <key>TableLength</key>
                <integer>0</integer>
                <key>TableSignature</key>
                <data>
                AAAAAA==
                </data>
            </dict>
            <dict>
                <key>Comment</key>
                <string>TIMR IRQ 0 Patch (SSDTTime)</string>
                <key>Count</key>
                <integer>0</integer>
                <key>Enabled</key>
                <true/>
                <key>Find</key>
                <data>
                BCIBAHkA
                </data>
                <key>Limit</key>
                <integer>0</integer>
                <key>Mask</key>
                <data>
                </data>
                <key>OemTableId</key>
                <data>
                AAAAAA==
                </data>
                <key>Replace</key>
                <data>
                BCIAAHkA
                </data>
                <key>ReplaceMask</key>
                <data>
                </data>
                <key>Skip</key>
                <integer>0</integer>
                <key>TableLength</key>
                <integer>0</integer>
                <key>TableSignature</key>
                <data>
                AAAAAA==
                </data>
            </dict>
        </array>
    </dict>
</dict>
```

## `patches.elitedesk800.opencore/SSDT-SBUS-MCHC.dsl`
[up up up](#)

[Fixing SMBus support (SSDT-SBUS-MCHC)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html)

## `patches.elitedesk800.opencore/SSDT-USBX.dsl`
[up up up](#)

[Fixing USB Power](https://dortania.github.io/OpenCore-Post-Install/usb/misc/power.html)

# DSDT patching (retired patches)
[up up up](#)

## ~~`DSDT.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

open with MaciASL the `patches.elitedesk800.clover/DSDT.dsl`. In the preferences use the `ACPI 6.2a` and try to compile. If you have only warnings you are good to proceed.

Because we are hotpatching here you should not use the `DSDT.aml` in the clover directory. If you need to use it for debugging purposes then you need to put it in `CLOVER/ACPI/patched` and check the clover setting `config.plist/ACPI/DSDT/Fixes/FixRegions=true)` to fix the *Floating Regions* as described in [Rehabman's guide](https://www.tonymacx86.com/threads/guide-patching-laptop-dsdt-ssdts.152573/)

## ~~`patches.elitedesk800.clover/SSDT-XOSI.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

copy `cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-XOSI.dsl patches.air/SSDT-XOSI.dsl` and edit `patches.air/SSDT-XOSI.dsl`

apply clover renames (OSIN first because there is some type of bug on the DSDT patching when applying only the second one):

* change OSIN to XSIN (SSDT-XOSI.dsl) `T1NJTg==` to `WFNJTg==`
* change _OSI to XOSI (SSDT-XOSI.dsl) `X09TSQ==` to `WE9TSQ==`

This XOSI simulates "Windows 2015" (which is Windows 10)

## ~~`patches.elitedesk800.clover/SSDT-RMCF.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-RMCF.dsl patches.elitedesk800.clover/SSDT-RMCF.dsl` and edit it uaccording to the readme

## ~~`patches.elitedesk800.clover/SSDT-PTSWAK.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-PTSWAK.dsl patches.elitedesk800.clover/SSDT-PTSWAK.dsl`

Overriding _PTS and _WAK. There is no discrete card in *EliteDesk-800*. However this is known from the `SSDT-RMCF.dsl` and you do not make any changes.

apply clover renames:

* change Method(_PTS,1,N) to ZPTS (SSDT-PTSWAK.dsl) `X1BUUwE=` to `WlBUUwE=`
* change Method(_WAK,1,S) to ZWAK (SSDT-PTSWAK.dsl) `X1dBSwk=` to `WldBSwk=`

## ~~`patches.elitedesk800.clover/SSDT-GPRW.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-GPRW.dsl patches.elitedesk800.clover/SSDT-GPRW.dsl`

For solving instant wake by hooking GPRW

apply clover renames:

* change Method(GPRW,2,N) to XPRW (SSDT-GPRW.dsl) `R1BSVwI=` to `WFBSVwI=`

## ~~`patches.elitedesk800.clover/SSDT-RMDT.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-RMDT.dsl patches.elitedesk800.clover/SSDT-RMDT.dsl`

Facility for writing trace output to system.log, Use in conjunction with ACPIDebug.kext

## ~~`patches.elitedesk800.clover/SSDT-DMAC.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

Add missing DMAC Device to enhace performance like a real Mac. Inspired by [syscl](https://github.com/syscl/XPS9350-macOS/tree/master/DSDT/patches).

## ~~`patches.elitedesk800.clover/SSDT-HPET.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

Disable HPET device by passing value 0 to HPTE to to behave more like a real Mac.

> updated 20190718 (from daliansky/XiaoMi-Pro-Hackintosh repository)

## ~~`patches.elitedesk800.clover/SSDT-MEM2.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

Add missing MEM2 Device to enhace performance like a real Mac. Inspired by [syscl](https://github.com/syscl/XPS9350-macOS/tree/master/DSDT/patches).

> updated 20190718 (from daliansky/XiaoMi-Pro-Hackintosh repository)

## ~~`patches.elitedesk800.clover/SSDT-PMCR.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

Add missing PMCR Device to enhace performance like a real Mac. Inspired by [syscl](https://github.com/syscl/XPS9350-macOS/tree/master/DSDT/patches). (PPMC and PMCR combine together for macOS to load LPCB correctly).

> updated 20190718 (from daliansky/XiaoMi-Pro-Hackintosh repository)

## ~~`patches.elitedesk800.clover/SSDT-LPC.dsl`~~
[up up up](#)

**November 2020**: migration to OpenCore. Removed ([Dortania Guides](https://dortania.github.io/getting-started/))

`cp $HACK/git/Rehabman.git/OS-X-Clover-Laptop-Config.git/hotpatch/SSDT-LPC.dsl patches.elitedesk800.clover/SSDT-LPC.dsl`

To fix unsupported 8-series LPC devices. looked in ioreg and look for LPC. mine is 0x9d48 which is included here

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

# `config.plist`
[up up up](#)

[Desktop Skylake](https://dortania.github.io/OpenCore-Install-Guide/config.plist/skylake.html#starting-point)

## ACPI
[up up up](#)

autogenerate with OC Snapshot/OC Clean Snapshot in the beggining)

## Booter
[up up up](#)

leave default

## DeviceProperties
[up up up](#)

start with bare minimum according to documentation

* Sound card is `Realtek ALC221` which is driven by `AppleALC`:


```xml
<key>PciRoot(0x0)/Pci(0x1f,0x3)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal@0,31,3</string>
    <key>device_type</key>
    <string>Audio device</string>
    <key>hda-idle-support</key>
    <string>1</string>
    <key>layout-id</key>
    <integer>11</integer>
    <key>model</key>
    <string>Realtek ALC221 Audio Controller</string>
</dict>
<key>PciRoot(0x0)/Pci(0x1f,0x3)</key>
```

video, Intel HD Graphics 530, 0x19120000, stolenmem patch

```xml
<key>PciRoot(0x0)/Pci(0x2,0x0)</key>
<dict>
    <key>AAPL,ig-platform-id</key>
    <data>AAASGQ==</data>
    <key>AAPL,slot-name</key>
    <string>Internal@0,2,0</string>
    <key>device_type</key>
    <string>Display controller</string>
    <key>model</key>
    <string>Intel HD Graphics 530</string>
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
</dict>
```

```xml
<key>PciRoot(0x0)/Pci(0x14,0x0)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal@0,20,0</string>
    <key>device_type</key>
    <string>USB controller</string>
    <key>model</key>
    <string>100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller</string>
</dict>
<key>PciRoot(0x0)/Pci(0x1F,0x6)</key>
<dict>
    <key>AAPL,slot-name</key>
    <string>Internal@0,31,6</string>
    <key>device_type</key>
    <string>Ethernet controller</string>
    <key>model</key>
    <string>Ethernet Connection (2) I219-LM</string>
</dict>
```

## Kernel
[up up up](#)

* `AppleXcpmCfgLock`: `True` (CFG Locked)
* `LapicKernelPanic`: `True` for hp systems
* `PanicNoKextDump`: `True` Allows for reading kernel panics logs when kernel panics occur
* `PowerTimeoutKernelPanic`: `True` Helps fix kernel panics relating to power changes with Apple drivers in macOS Catalina, most notably with digital audio.
* `XhciPortLimit`: `True` This is actually the 15 port limit patch, don't rely on it as it's not a guaranteed solution for fixing USB. Please create a USB map when possible.

## Misc
[up up up](#)

* `Boot > HideAuxiliary > True`: so only the bootable ones space to see everything

* `Security > AllowNvramReset > True`: Allows for NVRAM reset both in the boot picker and when pressing Cmd+Opt+P+R
* `Security > AllowSetDefault > True`: Allow CTRL+Enter and CTRL+Index to set default boot device in the picker
* `Security > Vault > Optional`: We won't be dealing vaulting so we can ignore, you won't boot with this set to Secure. note that it is case-sensitive
* `Security > ScanPolicy > 0`: 0 allows you to see all drives available
* `Security > SecureBootModel > Default`: Enables Apple's secure boot functionality in macOS, please refer to Security section for further details.

## NVRAM
[up up up](#)

* `4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14` Used for OpenCore's UI scaling, default will work for us.
* `4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14 > UIScale > 1`: Standard resolution (2 HiDPI (generally required for FileVault to function correctly on smaller displays))
* `4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14 > DefaultBackgroundColor > 00000000`: Syrah Black


* `4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102` OpenCore's NVRAM GUID, mainly relevant for RTCMemoryFixup users.

* `7C436110-AB2A-4BBB-A880-FE41995C9F82` SIP bitmask
* `7C436110-AB2A-4BBB-A880-FE41995C9F82> boot-args > -v keepsyms=1 debug=0x100 agdpmod=vit9696 gfxrst=1 -igfxnohdmi -cdfon rtcfx_exclude=58-59,B0-B3,D0-DF`
* `7C436110-AB2A-4BBB-A880-FE41995C9F82 > csr-active-config > 00000000` enables System Integrity Protectio
* `7C436110-AB2A-4BBB-A880-FE41995C9F82 > un-efi-updater > False`: This is used to prevent Apple's firmware update packages from installing and breaking boot order; this is important as these firmware updates (meant for Macs) will not work.
* `7C436110-AB2A-4BBB-A880-FE41995C9F82 > prev-lang:kbd > 656e2d55533a30`: Default in Sample config is Russian, use 656e2d55533a30 for enUS

* `WriteFlash > True`: Enables writing to flash memory for all added variables.

## PlatformInfo
[up up up](#)

* `Generic > ROM > 112233445566` Mac address of the buildin interface.
* `Generic > SystemProductName > iMac17,1`
* `Generic > MLB > XXXXXXXXXXXXXXXXX`
* `Generic > SystemSerialNumber > XXXXXXXXXXXX`
* `Generic >  SystemUUID > XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`
* `Automatic > True` Generates PlatformInfo based on Generic section instead of DataHub, NVRAM, and SMBIOS sections#

## UEFI
[up up up](#)

* `ConnectDrivers > True` Forces .efi drivers
* `Drivers` Only drivers present here should be: HfsPlus.efi OpenRuntime.ef
* `Quirks > ReleaseUsbOwnership > True` Releases USB controller from firmware driver, needed for when your firmware doesn't support EHCI/XHCI Handoff. Most laptops have garbage firmwares so we'll need this as well

## OpenCore beauty treatment
[up up up](#)

[Add Gui and Boot-chime](https://dortania.github.io/OpenCore-Post-Install/cosmetic/gui.html#setting-up-opencore-s-gui)

* `OC/Drivers/OpenCanopy.efi`
* `OC/Drivers/AudioDxe.efi`
* `OC/Resources` from [OcBinaryData](https://github.com/acidanthera/OcBinaryData)
* `Misc -> Boot -> PickerMode: External`
* `Misc -> Boot -> PickerAttributes:1`
* `NVRAM -> Add -> 7C436110-AB2A-4BBB-A880-FE41995C9F82 > SystemAudioVolume | Data | 0x46`

UEFI

```xml
<key>Audio</key>
<dict>
    <key>AudioCodec</key>
    <integer>0</integer>
    <key>AudioDevice</key>
    <string>PciRoot(0x0)/Pci(0x1f,0x3)</string>
    <key>AudioOut</key>
    <integer>0</integer>
    <key>AudioSupport</key>
    <true/>
    <key>MinimumVolume</key>
    <integer>70</integer>
    <key>PlayChime</key>
    <true/>
    <key>VolumeAmplifier</key>
    <integer>143</integer>
</dict>
```

```bash
cd /Downloads
wget https://github.com/acidanthera/OcBinaryData/archive/master.zip && unzip master.zip
\rm -rf /Volumes/EFI/EFI/OC/Resources
mv OcBinaryData-master/Resources /Volumes/EFI/EFI/OC/Resources
```

# How to Debug
[up up up](#)

> Note: In a production machine change `Misc > Debug > AppleDebug > True` to `Misc > Debug > AppleDebug > False` to avoid all debug files writen on the file system. reference [OpenCore Debugging](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/debug.html#opencore-debugging)

* `Misc > Debug > AppleDebug > True`: Enables boot.efi logging, useful for debugging. Note this is only supported on 10.15.4 and newer
* `Misc > Debug > ApplePanic > True`: Attempts to log kernel panics to disk
* `Misc > Debug > DisableWatchDog > True`: Disables the UEFI watchdog, can help with early boot issues
* `Misc > Debug > DisplayLevel > 2147483650`: Shows even more debug information, requires **DEBUG** version of OpenCore
* `Misc > Debug > SerialInit > False`: Needed for setting up serial output with OpenCore
* `Misc > Debug > SysReport > False`: Helpful for debugging such as dumping ACPI tables, Note that this is limited to **DEBUG** versions of OpenCore
* `Misc > Debug > Target > 67`: Shows more debug information, Note that this is limited to **DEBUG** versions of OpenCore
* `Misc > Security > ExposeSensitiveData > 6`: Shows more debug information, requires **DEBUG** version of OpenCore

* `NVRAM > 7C436110-AB2A-4BBB-A880-FE41995C9F82 > boot-args > -v`
* `NVRAM > 7C436110-AB2A-4BBB-A880-FE41995C9F82 > boot-args > debug=0x100`: this disables macOS's watchdog which helps prevents a reboot on a kernel panic
* `NVRAM > 7C436110-AB2A-4BBB-A880-FE41995C9F82 > boot-args > keepsyms=1`: This is a companion setting to debug=0x100 that tells the OS to also print the symbols on a kernel panic

[OpenCore Debugging](https://dortania.github.io/OpenCore-Install-Guide/troubleshooting/debug.html#file-swaps)

# RTC problems
[up up up](#)

[Finding our bad RTC region](https://dortania.github.io/OpenCore-Post-Install/misc/rtc.html#finding-our-bad-rtc-region) and [here](https://www.tonymacx86.com/threads/hp-elitedesk-800-g2-hp-prodesk-600-g2-success.261452/page-21#post-2101758) and [here](https://www.tonymacx86.com/threads/hp-elitedesk-800-g2-hp-prodesk-600-g2-success.261452/page-21#post-2109461)

```text
RTCMemoryFix.kext works in Clover and OpenCore. This is the way to avoid POST errors on reboot.

Even for Clover better use this instead of the FixRTC patch, since it breaks hibernation by reducing the available RTC memory and avoiding encryption key preservation.

For this machine add "rtcfx_exclude=58-59,D0-DF" in your boot args list. Tested with Clover V5.0 r5008 and OpenCore 0.5.7 together with current Mojave and Catalina. It was really much work to find this out...

You are welcome! One additional note to that: I notice post errors when doing updates or using the installer. To avoid this add B0-B3. That is, "rtcfx_exclude=58-59,B0-B3,D0-DF"
```

# TRIM on SSDs
[up up up](#)

based on the `Configuration.pdf` of Opencore:

```text
ThirdPartyDrives
Type: plist boolean
Failsafe: false
Requirement: 10.6 (not required for older)
Description: Apply vendor patches to IOAHCIBlockStorage.kext to enable native features for third-party drives, such as TRIM on SSDs or hibernation support on 10.15 and newer.
Note: This option may be avoided on user preference. NVMe SSDs are compatible without the change. For AHCI SSDs on modern macOS version there is a dedicated built-in utility called trimforce. Starting from 10.15 this utility creates EnableTRIM variable in APPLE_BOOT_VARIABLE_GUID namespace with 01 00 00 00 value.
```

this means that once you boot with Opencore you need to enable TRIM on all SSDs with the command: `sudo trimforce enable`

# Audio
[up up up](#)

* Sound card is `Realtek ALC221` which is drived by `AppleALC` on layout-id 22.

kext patches in `OC/Kexts` applied:

* `AppleALC.kext` Native macOS HD audio for not officially supported codecs

`config.plist` patch applied:

* Patch `Devices > PciRoot(0x0)/Pci(0x1f,0x3)`

# Ethernet
[up up up](#)

* EliteDesk-800 has an `Intel® I219LM Gigabit Network Connection LOM` which works with `Fork of Mieze's Intel Mausi Network Driver by RehabMan`.

* `IntelMausi.kext`

# Graphics
[up up up](#)

* Supported card is `Intel HD Graphics 530` supported with edits in `config.plist`

* `WhateverGreen.kext` Various patches necessary for certain ATI/AMD/Intel/Nvidia GPUs

`config.plist` patch applied:

* Patch `Devices > PciRoot(0x0)/Pci(0x2,0x0)`

# USB Mapping
[up up up](#)

[USB Mapping](https://dortania.github.io/OpenCore-Post-Install/usb/intel-mapping/intel.html)

```bash
$ cd /Downloads/USBMap-master
$ ./USBMap.command
```

check [sources.opencore/USBMap.kext.zip](./sources.opencore/USBMap.kext.zip)

USB port patching is being done using USBMap.kext generated by HackingTool

The following ports are **disabled** :

* USB back, bottom row, 1rst from left
* USB back, bottom row, 2nd from left
* USB back, bottom row, 3rd from left
* USB back, bottom row, 4rth from left

# Sleep
[up up up](#)

consult [this link](https://www.tonymacx86.com/threads/guide-native-power-management-for-laptops.175801/) and [Fixing Sleep](https://dortania.github.io/OpenCore-Post-Install/universal/sleep.html#preparations)

I did these but did not check further

```bash
pmset -g
sudo pmset autopoweroff 0
sudo pmset powernap 0
sudo pmset standby 0
sudo pmset proximitywake 0
```

# `kexts`
[up up up](#)

used

* [OpenCore-0.6.2-RELEASE.zip](https://github.com/acidanthera/OpenCorePkg/releases/download/0.6.2/OpenCore-0.6.2-RELEASE.zip)
* [OcBinaryData](https://github.com/acidanthera/OcBinaryData)
* [VirtualSMC-1.1.7-RELEASE.zip](https://github.com/acidanthera/VirtualSMC/releases/download/1.1.7/VirtualSMC-1.1.7-RELEASE.zip) (without `SMCLightSensor.kext` and `SMCDellSensors.kext`)
* [Lilu-1.4.8-RELEASE.zip](https://github.com/acidanthera/Lilu/releases/download/1.4.8/Lilu-1.4.8-RELEASE.zip)
* [WhateverGreen-1.4.3-RELEASE.zip](https://github.com/acidanthera/WhateverGreen/releases/download/1.4.3/WhateverGreen-1.4.3-RELEASE.zip)
* [AppleALC-1.5.3-RELEASE.zip](https://github.com/acidanthera/AppleALC/releases/download/1.5.3/AppleALC-1.5.3-RELEASE.zip)
* [RehabMan-USBInjectAll-2018-1108.zip](https://bitbucket.org/RehabMan/os-x-usb-inject-all/downloads/RehabMan-USBInjectAll-2018-1108.zip)
* [IntelMausi-1.0.4-RELEASE.zip](https://github.com/acidanthera/IntelMausi/releases/download/1.0.4/IntelMausi-1.0.4-RELEASE.zip)
* [RTCMemoryFixup-1.0.7-RELEASE.zip](https://github.com/acidanthera/RTCMemoryFixup/releases/download/1.0.7/RTCMemoryFixup-1.0.7-RELEASE.zip)

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
