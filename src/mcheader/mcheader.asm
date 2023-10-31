           ************************************************************************
           ***                                                                  ***
           ***             -= COMMODORE CDTV ROM OPERATING SYSTEM =-            ***
           ***                                                                  ***
           ************************************************************************
           ***                                                                  ***
           ***     CDTV OS Memory Card Header (mcheader)                        ***
           ***     Copyright (c) 2023 CDTV Land. Published under GPLv3.         ***
           ***     Written by Captain Future                                    ***
           ***                                                                  ***
           ************************************************************************


  INCLUDE      exec/exec_lib.i
  INCLUDE      exec/execbase.i
  INCLUDE      exec/resident.i
  INCLUDE      defs.i
  INCLUDE      rev.i


  ; This resident module is for the "CDTV OS 2.35 for memory cards" (CD1401/CD1405) upgrade.
  ; It must be placed at the beginning of the ROM buildlist so that when the resulting ROM image
  ; is loaded to $E00000, it will have the correct magic word there. Otherwise the whole
  ; memory card is wiped by cardmark.device on system startup. An additional couple of bytes
  ; of space are needed, because the build tools (DoBuild) will blindly poke the ROM version
  ; and revision values in there. Anything after the -1 longword is safe.

;************************************************************************************************
;*                                           HEADER                                             *
;************************************************************************************************
Header:
  dc.b         "RO"                          ; magic value to indicate this mem is in use
  dc.w         0
  dc.l         0
  dc.l         0
  dc.l         0
  dc.l         -1

IDString:
  VSTRING
Name:
  dc.b         "CDTV OS memcard header",0
  COPYRIGHT

;************************************************************************************************
;*                                           ROM TAG                                            *
;************************************************************************************************

ROMTag:
  dc.w         RTC_MATCHWORD
  dc.l         ROMTag
  dc.l         EndSkip
  dc.b         0                             ; we don't need initialization
  dc.b         VERSION
  dc.b         NT_UNKNOWN
  dc.b         -120                          ; recommended priority for non-init residents
  dc.l         Name
  dc.l         IDString
  dc.l         rtInit

  CNOP         0,2

;************************************************************************************************
;*                                           FUNCTION                                           *
;************************************************************************************************
rtInit:
  rts


EndSkip:

  END