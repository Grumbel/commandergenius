# If SDL_Mixer should link to GPL-polluted libMAD (TODO: move this out of here)
SDL_MIXER_USE_LIBMAD :=
ifneq ($(strip $(filter mad, $(COMPILED_LIBRARIES))),)
SDL_MIXER_USE_LIBMAD := 1
endif

# Disable timidity library inside sdl2_mixer, we have our own version of timidity used by OpenTTD
SUPPORT_MID_TIMIDITY := 0

NDK_VERSION := $(strip $(patsubst android-ndk-%,%,$(filter android-ndk-%, $(subst /, ,$(dir $(TARGET_CC))))))
#$(info NDK version $(NDK_VERSION)) # This warning puzzles ndk-gdb
ifneq ($(filter r1 r2 r3 r4 r5 r6 r7 r8,$(NDK_VERSION)),)
$(error Your NDK $(NDK_VERSION) is too old, please download NDK from http://developer.android.com)
endif

NDK_PATH := $(shell dirname $(shell which ndk-build))

include $(call all-subdir-makefiles)
