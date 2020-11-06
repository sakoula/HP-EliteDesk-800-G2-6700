/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-0-ShmTable.aml, Sun Jan 13 12:07:00 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000108 (264)
 *     Revision         0x02
 *     Checksum         0x8C
 *     OEM ID           "HP    "
 *     OEM Table ID     "ShmTable"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20121018 (538054680)
 */
DefinitionBlock ("", "SSDT", 2, "HP    ", "ShmTable", 0x00000001)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments

    Scope (\_SB.PCI0.LPCB)
    {
        Device (NSHM)
        {
            Name (IOBA, 0x00000200)
            Name (IOLN, 0x00000040)
            Name (MEBA, 0xFEDB0000)
            Name (MELN, 0x00010000)
            Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
            Name (_UID, 0x1000)  // _UID: Unique ID
            Name (BUF0, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x01,               // Alignment
                    0x00,               // Length
                    _Y2B)
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00000000,         // Address Length
                    _Y2C)
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUF0, \_SB.PCI0.LPCB.NSHM._Y2B._MIN, IMIN)  // _MIN: Minimum Base Address
                CreateWordField (BUF0, \_SB.PCI0.LPCB.NSHM._Y2B._MAX, IMAX)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, \_SB.PCI0.LPCB.NSHM._Y2B._LEN, ILEN)  // _LEN: Length
                Store (IOBA, IMIN)
                Store (IOBA, IMAX)
                Store (IOLN, ILEN)
                CreateDWordField (BUF0, \_SB.PCI0.LPCB.NSHM._Y2C._BAS, MBAS)  // _BAS: Base Address
                CreateDWordField (BUF0, \_SB.PCI0.LPCB.NSHM._Y2C._LEN, MLEN)  // _LEN: Length
                Store (MEBA, MBAS)
                Store (MELN, MLEN)
                Return (BUF0)
            }
        }
    }
}

