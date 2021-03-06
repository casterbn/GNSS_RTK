# 
# str2str configuration command file to enable raw measurements
# on u-blox6 (ROM 7.03) by means of RAM patch. Note different
# RAM patch for older version of ROM.
#
# Documentation and discussion:
#
# https://wiki.openstreetmap.org/wiki/UbloxRAW#U-BLOX6
# http://open-source-gps-related-discussion-and-support.1099874.n2.nabble.com/Raw-Data-from-NEO-6M-td7572786.html
#
# TODO: increase UART bps: 9600 is not sufficient.

# Set sample rate low while configuring receiver
!UBX CFG-RATE 1000 1 1


# From http://xtronix.in/blog/?p=403
# Port configuration, see uBlox M6 section 31.16.3  CFG-PRT (0x06 0x00) Get/Set Port Configuration for UART
# Does not make sense. Does not match with datasheet explanation.
# Port IDs: 0=? 1=UART, 2=UART, 3=USB, 4=SPI, 5=DDC
#            | len |port |txRdy|mode    |bps=9k6    |inpr |outpr|reserved   |??????
#!HEX b5 62 06 00 14 00 01 00 00 00 d0 08 00 00 80 25 00 00 07 00 01 00 00 00 00 00 a0 a9 b5 62 06 00 01 00 01 08 22

# Undocumented magic RAM patch specific to ROM version 7.03 (see link for older firmware)
!HEX b5 62 09 01 10 00 c8 16 00 00 00 00 00 00 97 69 21 00 00 00 02 10 2b 22
!HEX b5 62 09 01 10 00 0c 19 00 00 00 00 00 00 83 69 21 00 00 00 02 11 5f f0

# Poll RXM-RAW
!HEX b5 62 06 01 03 00 02 10 01 1d 66

# Poll RXM-SFRB
!HEX b5 62 06 01 03 00 02 11 01 1e 68

#!HEX b5 62 09 01 10 00 c8 16 00 00 00 00 00 00 97 69 21 00 00 00 02 10 2b 22
#!HEX b5 62 09 01 10 00 0c 19 00 00 00 00 00 00 83 69 21 00 00 00 02 11 5f f0
#!HEX b5 62 06 01 03 00 02 10 01 1d 66
#!HEX b5 62 06 01 03 00 02 11 01 1e 68


# turn on UBX NAV-SVINFO on USB
!UBX CFG-MSG  1 48  0 1 0 1 0 0

# turn non UBX NAV-SOL on USB
!UBX CFG-MSG  1  6  0 1 0 1 0 0

#
# Turn off all NMEA
#

# Turn off NMEA GGA
!UBX CFG-MSG 240 0 0 0 0 0 0 0

# Turn off NMEA GLL
!UBX CFG-MSG 240 1 0 0 0 0 0 0

# Turn off NMEA GSA
!UBX CFG-MSG 240 2 0 0 0 0 0 0

# Turn off NMEA GSV
!UBX CFG-MSG 240 3 0 0 0 0 0 0

# Turn off NMEA RMC
!UBX CFG-MSG 240 4 0 0 0 0 0 0

# Turn off NMEA VTG
!UBX CFG-MSG 240 5 0 0 0 0 0 0

# Turn off NMEA ZDA
!UBX CFG-MSG 240 8 0 0 0 0 0 0

