# CDTV mcheader resident module

This repo contains the source code to the CDTV mcheader resident module that is part of the _CDTV OS 2.35 for Memory Cards_ update.

## Background

This resident module is for the "CDTV OS 2.35 for memory cards" (CD1401/CD1405) upgrade. It must be placed at the beginning of the ROM buildlist so that when the resulting ROM image is loaded to $E00000, it will have the correct magic word there. Otherwise the whole memory card is wiped by cardmark.device on system startup. An additional couple of bytes of space are needed, because the build tools (DoBuild) will blindly poke the ROM version and revision values in there. Anything after the -1 longword is safe.

## Binary

The loadable module can be downloaded from the [Releases](https://github.com/C4ptFuture/cdtv-mcheader/releases/) page.


## How to build

Alternatively, you can build the module yourself from source and modify it as you see fit. You will need vasm, vlink and the Amiga NDK. To build the resident module issue the following command:

```sh
ENVIRONMENT=release make mcheader
```
