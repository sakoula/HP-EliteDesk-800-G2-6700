/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-4-PtidDevc.aml, Sun Jan 13 12:07:00 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000729 (1833)
 *     Revision         0x01
 *     Checksum         0x1F
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "PtidDevc"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20121018 (538054680)
 */
DefinitionBlock ("", "SSDT", 1, "HPQOEM", "PtidDevc", 0x00001000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (PAMT, FieldUnitObj)

    Scope (\_SB)
    {
        Device (PTID)
        {
            Name (_HID, EisaId ("INT340E"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0C02"))  // _CID: Compatible ID
            Name (IVER, 0x00030000)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Name (TSDL, Package (0x24)
            {
                Zero, 
                "CPU Core 0 DTS", 
                Zero, 
                "CPU Core 1 DTS", 
                Zero, 
                "CPU Core 2 DTS", 
                Zero, 
                "CPU Core 3 DTS", 
                Zero, 
                "CPU Core Package DTS", 
                0x03, 
                "CPU Core VR (IMVP) Temperature", 
                0x03, 
                "Heat Exchanger Fan Temperature", 
                0x03, 
                "Skin Temperature", 
                0x03, 
                "Ambient Temperature", 
                0x02, 
                "Sensor 5 Not used.", 
                0x02, 
                "Channel 0 DIMM Temperature", 
                0x02, 
                "Channel 1 DIMM Temperature", 
                Zero, 
                "CPU Package Temperature", 
                0x05, 
                "PCH DTS Temperature from PCH", 
                Zero, 
                "CPU PECI reading", 
                0x05, 
                "SA DTS Temperature from PCH", 
                0x02, 
                "TZ00 _TMP", 
                0x02, 
                "TZ01 _TMP"
            })
            Name (PSDL, Package (0x26)
            {
                0x0B, 
                "Platform Power (mW)", 
                0x0B, 
                "Brick Power cW(100ths)", 
                0x0B, 
                "Battery Discharge Power cW(100ths)", 
                0x0B, 
                "Platform Average Power (mW)", 
                0x0B, 
                "Brick Average Power cW(0.01)", 
                0x0B, 
                "Battery Discharge Average Power cW(0.01)", 
                0x0C, 
                "Battery 1 Design Capacity (mWh)", 
                0x0C, 
                "Battery 1 Remaining Capacity (mWh)", 
                0x0C, 
                "Battery 1 Full Charge Capacity (mWh)", 
                0x0C, 
                "Battery 1 Full Resolution Voltage (mV)", 
                0x0C, 
                "Battery 1 Full Resolution Discharge Current (mA)", 
                0x0C, 
                "Battery 1 Full Resolution Charge Current (mA)", 
                0x0C, 
                "Battery 2 Remaining Capacity (mWh)", 
                0x0C, 
                "Battery 2 Full Charge Capacity (mWh)", 
                0x0C, 
                "Battery 2 Full Resolution Voltage (mV)", 
                0x0C, 
                "Battery 2 Full Resolution Discharge Current (mA)", 
                0x0C, 
                "Battery 2 Full Resolution Charge Current (mA)", 
                0x0C, 
                "Battery Pack 1 maximum power (mW)", 
                0x0C, 
                "Battery Pack 2 maximum power (mW)"
            })
            Name (OSDL, Package (0x09)
            {
                0x04, 
                "CPU Fan Duty Cycle", 
                "RAW", 
                0x04, 
                "CPU Fan #1 Speed", 
                "RPM", 
                0x03, 
                "Skin Temp 0", 
                "RAW"
            })
            Method (TSDD, 0, Serialized)
            {
                Name (TMPV, Package (0x16)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                })
                Return (TMPV)
            }

            Method (PSDD, 0, Serialized)
            {
                Name (PWRV, Package (0x13)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                })
                Return (PWRV)
            }

            Method (OSDD, 0, Serialized)
            {
                Name (OSDV, Package (0x09)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                })
                Return (OSDV)
            }

            Method (SDSP, 0, NotSerialized)
            {
                Return (0x0A)
            }

            Name (PADA, Package (0x0A)
            {
                One, 
                Ones, 
                Ones, 
                0x1A, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones, 
                Ones
            })
            Name (PADD, Package (0x0A)
            {
                0x02, 
                0x06A4, 
                0x06A0, 
                0x1A, 
                0x62, 
                0x63, 
                0x60, 
                0x61, 
                0x65, 
                0x64
            })
            Method (PADT, 0, NotSerialized)
            {
                If (PAMT)
                {
                    Return (PADA)
                }

                Return (PADD)
            }

            Method (RPMD, 0, Serialized)
            {
                Name (MTMP, Buffer (0x1A){})
                Return (MTMP)
            }

            Method (WPMD, 1, NotSerialized)
            {
                If (LNotEqual (SizeOf (Arg0), 0x1A))
                {
                    Return (Ones)
                }

                Return (Zero)
            }

            Method (ISPC, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (ENPC, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (RPCS, 0, NotSerialized)
            {
                Store (Zero, Local0)
                Return (Local0)
            }

            Method (RPEC, 0, NotSerialized)
            {
                Store (Zero, Local0)
                Return (Local0)
            }
        }
    }
}

