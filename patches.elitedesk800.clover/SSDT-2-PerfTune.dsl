/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-2-PerfTune.aml, Sun Jan 13 12:07:00 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000005B1 (1457)
 *     Revision         0x01
 *     Checksum         0xE5
 *     OEM ID           "Intel"
 *     OEM Table ID     "PerfTune"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20121018 (538054680)
 */
DefinitionBlock ("", "SSDT", 1, "Intel", "PerfTune", 0x00001000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.CFSP, UnknownObj)    // Warning: Unknown object
    External (_SB_.PCI0.LPCB.H_EC.CVRT, UnknownObj)    // Warning: Unknown object
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.TSD0, UnknownObj)    // Warning: Unknown object
    External (_SB_.PCI0.LPCB.H_EC.TSD1, UnknownObj)    // Warning: Unknown object
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (_TZ_.TZ01._TMP, IntObj)    // Warning: Unknown object
    External (ADBG, MethodObj)    // 1 Arguments
    External (DDRF, FieldUnitObj)
    External (ECON, FieldUnitObj)
    External (TSOD, FieldUnitObj)
    External (XMPB, FieldUnitObj)
    External (XTUB, FieldUnitObj)
    External (XTUS, FieldUnitObj)

    Scope (\_SB)
    {
        Device (PTMD)
        {
            Name (_HID, EisaId ("INT3394"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0C02"))  // _CID: Compatible ID
            Name (IVER, 0x00010000)
            Name (SIZE, 0x055C)
            Method (GACI, 0, NotSerialized)
            {
                Name (RPKG, Package (0x02){})
                Store (Zero, Index (RPKG, Zero))
                If (LNotEqual (XTUB, Zero))
                {
                    ADBG ("XTUB")
                    ADBG (XTUB)
                    ADBG ("XTUS")
                    ADBG (XTUS)
                    OperationRegion (XNVS, SystemMemory, XTUB, SIZE)
                    Field (XNVS, ByteAcc, NoLock, Preserve)
                    {
                        XBUF,   10976
                    }

                    Name (TEMP, Buffer (XTUS){})
                    Store (XBUF, TEMP)
                    Store (TEMP, Index (RPKG, One))
                }
                Else
                {
                    ADBG ("XTUB ZERO")
                    Store (Zero, Index (RPKG, One))
                }

                Return (RPKG)
            }

            Method (GDSV, 1, Serialized)
            {
                If (LEqual (Arg0, 0x05))
                {
                    Return (Package (0x02)
                    {
                        Zero, 
                        Buffer (0x40)
                        {
                            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x46, 0x05, 0x00, 0x00,
                            /* 0008 */  0x01, 0x00, 0x00, 0x00, 0x79, 0x05, 0x00, 0x00,
                            /* 0010 */  0x02, 0x00, 0x00, 0x00, 0xA9, 0x05, 0x00, 0x00,
                            /* 0018 */  0x03, 0x00, 0x00, 0x00, 0xDC, 0x05, 0x00, 0x00,
                            /* 0020 */  0x04, 0x00, 0x00, 0x00, 0xDF, 0x05, 0x00, 0x00,
                            /* 0028 */  0x05, 0x00, 0x00, 0x00, 0xFD, 0x05, 0x00, 0x00,
                            /* 0030 */  0x06, 0x00, 0x00, 0x00, 0x42, 0x06, 0x00, 0x00,
                            /* 0038 */  0x07, 0x00, 0x00, 0x00, 0x74, 0x06, 0x00, 0x00 
                        }
                    })
                }

                If (LEqual (Arg0, 0x13))
                {
                    ADBG ("DDR MULT")
                    If (LEqual (DDRF, One))
                    {
                        ADBG ("DDR 1")
                        Return (Package (0x02)
                        {
                            Zero, 
                            Buffer (0x38)
                            {
                                /* 0000 */  0x04, 0x00, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00,
                                /* 0008 */  0x05, 0x00, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00,
                                /* 0010 */  0x06, 0x00, 0x00, 0x00, 0xB0, 0x04, 0x00, 0x00,
                                /* 0018 */  0x07, 0x00, 0x00, 0x00, 0x78, 0x05, 0x00, 0x00,
                                /* 0020 */  0x08, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00,
                                /* 0028 */  0x09, 0x00, 0x00, 0x00, 0x08, 0x07, 0x00, 0x00,
                                /* 0030 */  0x0A, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00 
                            }
                        })
                    }
                    Else
                    {
                        ADBG ("DDR ELSE")
                        Return (Package (0x02)
                        {
                            Zero, 
                            Buffer (0x38)
                            {
                                /* 0000 */  0x04, 0x00, 0x00, 0x00, 0x2B, 0x04, 0x00, 0x00,
                                /* 0008 */  0x05, 0x00, 0x00, 0x00, 0x35, 0x05, 0x00, 0x00,
                                /* 0010 */  0x06, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00,
                                /* 0018 */  0x07, 0x00, 0x00, 0x00, 0x4B, 0x07, 0x00, 0x00,
                                /* 0020 */  0x08, 0x00, 0x00, 0x00, 0x55, 0x08, 0x00, 0x00,
                                /* 0028 */  0x09, 0x00, 0x00, 0x00, 0x60, 0x09, 0x00, 0x00,
                                /* 0030 */  0x0A, 0x00, 0x00, 0x00, 0x6B, 0x0A, 0x00, 0x00 
                            }
                        })
                    }

                    ADBG ("DDR EXIT")
                }

                If (LEqual (Arg0, 0x0B))
                {
                    Return (Package (0x02)
                    {
                        Zero, 
                        Buffer (0x40)
                        {
                            /* 0000 */  0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00,
                            /* 0008 */  0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00,
                            /* 0010 */  0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00,
                            /* 0018 */  0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,
                            /* 0020 */  0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00,
                            /* 0028 */  0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00,
                            /* 0030 */  0x0E, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00,
                            /* 0038 */  0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00 
                        }
                    })
                }

                Return (Package (0x01)
                {
                    One
                })
            }

            Method (GXDV, 1, Serialized)
            {
                If (LNotEqual (XMPB, Zero))
                {
                    OperationRegion (XMPN, SystemMemory, XMPB, SIZE)
                    Field (XMPN, ByteAcc, NoLock, Preserve)
                    {
                        XMP1,   704, 
                        XMP2,   704
                    }

                    If (LEqual (Arg0, One))
                    {
                        Name (XP_1, Package (0x02){})
                        Store (Zero, Index (XP_1, Zero))
                        Store (XMP1, Index (XP_1, One))
                        Return (XP_1)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Name (XP_2, Package (0x02){})
                        Store (Zero, Index (XP_2, Zero))
                        Store (XMP2, Index (XP_2, One))
                        Return (XP_2)
                    }

                    Return (Package (0x01)
                    {
                        One
                    })
                }
            }

            Method (GSCV, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    0x72
                })
            }

            Method (CDRD, 1, Serialized)
            {
                Return (Package (0x01)
                {
                    One
                })
            }

            Method (CDWR, 2, Serialized)
            {
                Return (One)
            }

            Name (RPMV, Package (0x04)
            {
                One, 
                0x07, 
                Zero, 
                Zero
            })
            Name (TMP1, Package (0x0C)
            {
                One, 
                0x02, 
                Zero, 
                Zero, 
                0x05, 
                0x04, 
                Zero, 
                Zero, 
                0x06, 
                0x05, 
                Zero, 
                Zero
            })
            Name (TMP2, Package (0x08)
            {
                One, 
                0x02, 
                Zero, 
                Zero, 
                0x05, 
                0x04, 
                Zero, 
                Zero
            })
            Name (TMP3, Package (0x04)
            {
                One, 
                0x02, 
                Zero, 
                Zero
            })
            Method (TSDD, 0, NotSerialized)
            {
                If (LEqual (XTUS, Zero))
                {
                    Return (Zero)
                }

                If (\ECON)
                {
                    If (\TSOD)
                    {
                        Store (\_TZ.TZ01._TMP, Index (TMP1, 0x02))
                        Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.CVRT)), 0x0A), 0x0AAC), Index (TMP1, 0x06))
                        If (LGreater (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSD0)), \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSD1))))
                        {
                            Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSD0)), 0x0A), 0x0AAC), Index (TMP1, 0x0A))
                        }
                        Else
                        {
                            Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSD1)), 0x0A), 0x0AAC), Index (TMP1, 0x0A))
                        }

                        Return (TMP1)
                    }
                    Else
                    {
                        Store (\_TZ.TZ01._TMP, Index (TMP2, 0x02))
                        Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.CVRT)), 0x0A), 0x0AAC), Index (TMP2, 0x06))
                        Return (TMP2)
                    }
                }
                Else
                {
                    Store (\_TZ.TZ01._TMP, Index (TMP3, 0x02))
                    Return (TMP3)
                }
            }

            Method (FSDD, 0, NotSerialized)
            {
                If (LEqual (XTUS, Zero))
                {
                    Return (Zero)
                }

                If (\ECON)
                {
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.CFSP)), Index (RPMV, 0x02))
                }

                Return (RPMV)
            }

            Method (SDSP, 0, NotSerialized)
            {
                Return (0x0A)
            }
        }
    }
}

