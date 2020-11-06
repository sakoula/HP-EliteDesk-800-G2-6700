// SSDT-UIAC-ALL.dsl for wks-0088-25
//
// This SSDT can be used as a template to build your own
// customization for USBInjectAll.kext.
//
// This SSDT contains all ports, so using it is the same as without
// a custom SSDT.  Delete ports that are not connected or ports you
// do not need.
//
// Change the UsbConnector or portType as needed to match your
// actual USB configuration.
//
// check guide
// https://www.tonymacx86.com/threads/guide-creating-a-custom-ssdt-for-usbinjectall-kext.211311/
//
// Note:
// portType=0 seems to indicate normal external USB2 port (as seen in MacBookPro8,1)
// portType=2 seems to indicate "internal device" (as seen in MacBookPro8,1)
// portType=4 is used by MacBookPro8,3 (reason/purpose unknown)
//
// Port Discovery:
// HS01 HS USB3 back, top row, 1rst from left *enabled*
// HS02 HS USB3 back, top row, 2nd from left *enabled*
// HS03 HS USB3 back, bottom row, 3rd from left
// HS04 HS USB3 back, bottom row, 1rst from left
// HS05 HS USB3 back, bottom row, 2nd from left
// HS06 HS USB3 back, bottom row, 4rth from left
// HS08 HS USB2 front, 1rst row *enabled*
// HS09 HS USB3 front, 3rd row *enabled*
// HS10 HS USB2 front, 2nd row *enabled*
// HS11 HS USB3 front, 4th row *enabled*
// SS01 SS USB3 back, top row, 1rst from left *enabled*
// SS02 SS USB3 back, top row, 2nd from left *enabled*
// SS03 SS USB3 back, bottom row, 3rd from left
// SS04 SS USB3 back, bottom row, 1rst from left
// SS05 SS USB3 back, bottom row, 2nd from left
// SS06 SS USB3 front, 3rd row *enabled*
// SS07 SS USB3 front, 4rth row *enabled*
// SS09 SS USB3 back, bottom row, 4rth from left
//
// **enable 10** in order not to install the USB raise patch
// you will require USBInjectAll.kext
DefinitionBlock ("", "SSDT", 2, "hack", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "8086_a12f", Package()
            {
                "port-count", Buffer() { 26, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // HS USB3 back, top row, 1rst from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // HS USB3 back, top row, 2nd from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    //"HS03", Package() // HS USB3 back, bottom row, 3rd from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 3, 0, 0, 0 },
                    //},
                    //"HS04", Package() // HS USB3 back, bottom row, 1rst from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 4, 0, 0, 0 },
                    //},
                    //"HS05", Package() // HS USB3 back, bottom row, 2nd from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 5, 0, 0, 0 },
                    //},
                    //"HS06", Package() // HS USB3 back, bottom row, 4rth from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 6, 0, 0, 0 },
                    //},
                    "HS08", Package() // HS USB2 front, 1rst row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "HS09", Package() // HS USB3 front, 3rd row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 9, 0, 0, 0 },
                    },
                    "HS10", Package() // HS USB2 front, 2nd row
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    "HS11", Package() // HS USB3 front, 4th row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 11, 0, 0, 0 },
                    },
                    "SS01", Package() // SS USB3 back, top row, 1rst from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 17, 0, 0, 0 },
                    },
                    "SS02", Package() // SS USB3 back, top row, 2nd from left
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 18, 0, 0, 0 },
                    },
                    //"SS03", Package() // SS USB3 back, bottom row, 3rd from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 19, 0, 0, 0 },
                    //},
                    //"SS04", Package() // SS USB3 back, bottom row, 1rst from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 20, 0, 0, 0 },
                    //},
                    //"SS05", Package() // SS USB3 back, bottom row, 2nd from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 21, 0, 0, 0 },
                    //},
                    "SS06", Package() // SS USB3 front, 3rd row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 22, 0, 0, 0 },
                    },
                    "SS07", Package() // SS USB3 front, 4rth row
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 23, 0, 0, 0 },
                    },
                    //"SS09", Package() // SS USB3 back, bottom row, 4rth from left
                    //{
                    //    "UsbConnector", 3,
                    //    "port", Buffer() { 25, 0, 0, 0 },
                    //},
                },
            },
        })
    }
}
//EOF
