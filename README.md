# dataselect miniSEED for OpenWRT and RUTX

Apache-2.0 License (http://www.apache.org/licenses/LICENSE-2.0)

Copyright (C) 2023 Chad Trabant, EarthScope Data Services

Copyright (C) 2025, 2026 Geoscope Team <geoscope-admin@ipgp.fr>

## Building

get the sdk, untar it, then cd to it

    ./scripts/feeds update -a
    make tools/install
    make toolchain/install

    cd feeds/packages/utils
    git clone https://github.com/czo-gs/dataselect-rutx
    cd ../../..
    ./scripts/feeds update -a
    ./scripts/feeds install dataselect-rutx
    make menuconfig

Then in `Utilities  --->` select dataselect-rutx `<*> dataselect-rutx`

    make package/dataselect-rutx/compile
    make package/index

opkg .ipk is a file like `bin/packages/arm_cortex-a7_neon-vfpv4/packages/dataselect-rutx_4.1.2-1_arm_cortex-a7_neon-vfpv4.ipk`

## Install by Releases

You can get the release here: https://github.com/czo-gs/dataselect-rutx/releases

Then copy this file to your router and install it:

    opkg install /tmp/dataselect-rutx_4.1.2-1_arm_cortex-a7_neon-vfpv4.ipk

## Original README

### dataselect - Selection and sorting for data in miniSEED format.

This program is a general use tool for extracting a subset and sorting data in
miniSEED format.

For usage infromation see the [dataselect manual](doc/dataselect.md) in the
'doc' directory.

### Downloading

The [releases](https://github.com/earthscope/dataselect/releases) area contains release versions.

### Building and installing

Building the program requires a C compiler (C99-compatible) and the GNU make program.

In most environments a simple `make`, in the source directory, will build the program.
The CC and CFLAGS environment variables can be used to configure the build parameters.

After successfully compiling the program, the `dataselect` binary may be copied to
any desired location, normally in your PATH.  The man page, in the `doc` directory, may
be copied to somewhere in your MANPATH for use with the `man` program.

### License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Copyright (C) 2023 Chad Trabant, EarthScope Data Services
