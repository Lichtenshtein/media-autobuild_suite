#!/bin/bash

# Force to the suite to think the package has updates to recompile.
# Alternatively, you can use "touch recompile" for a similar effect.
touch custom_updated

_pre_configure(){
    #
    # Apply a patch from ffmpeg's patchwork site.
    # do_patch "https://patchwork.ffmpeg.org/patch/12563/mbox/" am
    #
    # Apply a local patch inside the directory where is "ffmpeg_extra.sh"
    # patch -p1 -i "$LOCALBUILDDIR/ffmpeg-0001-my_patch.patch"
    #
    # Add extra configure options to ffmpeg (ffmpeg specific)
    # If you want to add something to ffmpeg not within the suite already
    # you will need to install it yourself, either through pacman
    # or compiling from source.
    FFMPEG_OPTS+=(--enable-swscale --enable-nonfree --enable-w32threads --disable-pthreads --enable-protocol=file --enable-filter=vpp_amf --enable-filter=sr_amf --h264-max-bit-depth=14 --h265-bit-depths=8,9,10,12)
    #
}
