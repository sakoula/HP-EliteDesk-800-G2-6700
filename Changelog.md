# HP EliteDesk 800 G2 Tower PC (Skylake)

- 22-01-2019
    
    - Initial Release

- 01-02-2019

    - Fixed [Randomly does not boot on MacOS](https://www.tonymacx86.com/threads/hp-elitedesk-800-g2-hp-prodesk-600-g2-success.261452/page-9#post-1899904) by applying IRQ Fix as noted by pastrychef. This included FixHPET, FixIPIC, FixRTC, and FixTMR.
    - Fixed POST error by adding AppleRTC and KernelXCPM along with the IRQ Fix
    - removed SSDT_EC.aml and substitute it with 'change EC0 to EC (USB Related)' rename/
    - removed SSDT-USBX.aml and SSDT-UIAC.aml and USBInjectAll.kext. Generate USBPorts.kext using hackingtool 
    - Upgraded to 10.14.3
