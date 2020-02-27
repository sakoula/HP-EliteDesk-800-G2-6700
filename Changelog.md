# HP EliteDesk 800 G2 Tower PC (Skylake)

- 22-01-2019
    
    - Initial Release

- 01-02-2019

    - Fixed [Randomly does not boot on MacOS](https://www.tonymacx86.com/threads/hp-elitedesk-800-g2-hp-prodesk-600-g2-success.261452/page-9#post-1899904) by applying IRQ Fix as noted by pastrychef. This included FixHPET, FixIPIC, FixRTC, and FixTMR.
    - Fixed POST error by adding AppleRTC and KernelXCPM along with the IRQ Fix
    - removed SSDT_EC.aml and substitute it with 'change EC0 to EC (USB Related)' rename/
    - removed SSDT-USBX.aml and SSDT-UIAC.aml and USBInjectAll.kext. Generate USBPorts.kext using hackingtool 
    - Upgraded to 10.14.3

- 18-07-2019

    - updated for 10.14.5
    - upgrade clover to Clover_v2.5k_r5018
    - AptioInputFix.efi from acidanthera/AptioFixPkg AptioFix-R27-RELEASE.zip
    - AptioMemoryFix.efi from acidanthera/AptioFixPkg AptioFix-R27-RELEASE.zip
    - ApfsDriverLoader.efi from acidanthera/AppleSupportPkg AppleSupport-v2.0.8-RELEASE.zip
    - AppleUiSupport.efi from acidanthera/AppleSupportPkg AppleSupport-v2.0.8-RELEASE.zip
    - devices have been added in config.plist from the Hackingtool/PCItab and exported
    - upgrade to Lilu.1.3.7.RELEASE.zip
    - upgrade to AppleALC.1.3.9.RELEASE.zip
    - upgrade to HibernationFixup.1.2.6.RELEASE.zip
    - upgrade to VirtualSMC.1.0.6.RELEASE.zip
    - upgrade to WhateverGreen.1.3.0.RELEASE.zip
    - update `SSDT-HPET.dsl`
    - update `SSDT-MEM2.dsl`
    - update `SSDT-PMCR.dsl`

- 26-02-2020

    - updated for `10.15.3`
    - upgrade clover to `Clover_v2.5k_r5103`
    - `EFI/CLOVER/drivers/UEFI/ApfsDriverLoader.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/AudioDxe.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/EmuVariableUefi.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/FwRuntimeServices.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/HFSPlus.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/OcQuirks.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/OcQuirks.plist` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/UsbKbDxe.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/UsbMouseDxe.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/VirtualSmc.efi` from [z390 guide](https://www.tonymacx86.com/threads/success-gigabyte-designare-z390-thunderbolt-3-i7-9700k-amd-rx-580.267551/page-1131#post-2046300)
    - `EFI/CLOVER/drivers/UEFI/AppleGenericInput.efi` FileVault support from [The Vanilla Laptop Guide](https://fewtarius.gitbook.io/laptopguide/extras/enabling-filevault) from acidanthera/AppleSupportPkg AppleSupport-v2.0.9-RELEASE.zip
    - `EFI/CLOVER/drivers/UEFI/AppleUiSupport.efi` FileVault support from [The Vanilla Laptop Guide](https://fewtarius.gitbook.io/laptopguide/extras/enabling-filevault) from acidanthera/AppleSupportPkg AppleSupport-v2.0.8-RELEASE.zip
    - upgrade to `Lilu.1.4.1.RELEASE.zip`
    - upgrade to `AppleALC.1.4.6.RELEASE.zip`
    - upgrade to `HibernationFixup.1.3.2.RELEASE.zip`
    - upgrade to `VirtualSMC.1.0.9.RELEASE.zip`
    - upgrade to `WhateverGreen.1.3.6.RELEASE.zip`
    - upgrade to `IntelMausi-1.0.2-RELEASE.zip` (acidanthera / IntelMausi)
    - added small guide on readme for upgrading from `10.14.6` to `10.15.3`
