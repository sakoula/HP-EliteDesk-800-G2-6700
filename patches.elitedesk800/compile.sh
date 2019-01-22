# DSDT.comments.dsl
# DSDT.dsl
# ../../bin/iasl -ve DSDT.dsl

# this is the original DSDT.dsl from clover
# ../../bin/iasl -p DSDT -ve DSDT.original.dsl
# this is the DSDT.dsl with my edits
../../bin/iasl -p DSDT -ve DSDT.edited.dsl
../../bin/iasl -p SSDT-XOSI -ve SSDT-XOSI.dsl
../../bin/iasl -p SSDT-SMBUS -ve SSDT-SMBUS.dsl
../../bin/iasl -p SSDT-EC -ve SSDT-EC.dsl
../../bin/iasl -p SSDT-UIAC -ve SSDT-UIAC.dsl
../../bin/iasl -p SSDT-USBX -ve SSDT-USBX.dsl
../../bin/iasl -p SSDT-RMCF -ve SSDT-RMCF.dsl
../../bin/iasl -p SSDT-PTSWAK -ve SSDT-PTSWAK.dsl
../../bin/iasl -p SSDT-GPRW -ve SSDT-GPRW.dsl
../../bin/iasl -p SSDT-DMAC -ve SSDT-DMAC.dsl
../../bin/iasl -p SSDT-HPET -ve SSDT-HPET.dsl
../../bin/iasl -p SSDT-MEM2 -ve SSDT-MEM2.dsl
../../bin/iasl -p SSDT-PMCR -ve SSDT-PMCR.dsl
../../bin/iasl -p SSDT-LPC -ve SSDT-LPC.dsl
# only if you need debug with ACPIDebug.kext
# ../../bin/iasl -p SSDT-RMDT -ve SSDT-RMDT.dsl


