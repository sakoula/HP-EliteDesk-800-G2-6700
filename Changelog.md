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
    - update `SSDT-HPET.dsl`
    - update `SSDT-MEM2.dsl`
    - update `SSDT-PMCR.dsl`

- xxx
    - Typos
