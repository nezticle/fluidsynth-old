TEMPLATE = lib
TARGET = fluidsynth
VERSION = 1.1.6

DEFINES += VERSION=1.6.1
DEFINES += WITHOUT_SERVER=1

include(config.pri)

CONFIG -= qt #no qt modules involved

HEADERS += src/utils/fluid_conv.h \
           src/utils/fluid_hash.h \
           src/utils/fluid_list.h \
           src/utils/fluid_ringbuffer.h \
           src/utils/fluid_settings.h \
           src/utils/fluid_sys.h \
           src/sfloader/fluid_defsfont.h \
           src/sfloader/fluid_ramsfont.h \
           src/utils/fluidsynth_priv.h \
           src/sfloader/fluid_sfont.h \
           src/rvoice/fluid_adsr_env.h \
           src/rvoice/fluid_chorus.h \
           src/rvoice/fluid_iir_filter.h \
           src/rvoice/fluid_lfo.h \
           src/voice/fluid_rvoice.h \
           src/rvoice/fluid_rvoice_event.h \
           src/rvoice/fluid_rvoice_mixer.h \
           src/rvoice/fluid_phase.h \
           src/rvoice/fluid_rev.h \
           src/synth/fluid_chan.h \
           src/synth/fluid_event_priv.h \
           src/synth/fluid_event_queue.h \
           src/synth/fluid_gen.h \
           src/synth/fluid_mod.h \
           src/synth/fluid_synth.h \
           src/synth/fluid_tuning.h \
           src/synth/fluid_voice.h \
           src/midi/fluid_midi.h \
           src/midi/fluid_midi_router.h \
           src/drivers/fluid_adriver.h \
           src/drivers/fluid_mdriver.h \
           src/bindings/fluid_cmd.h \
           src/bindings/fluid_ladspa.h

SOURCES += src/utils/fluid_conv.c \
           src/utils/fluid_hash.c \
           src/utils/fluid_list.c \
           src/utils/fluid_ringbuffer.c \
           src/utils/fluid_settings.c \
           src/utils/fluid_sys.c \
           src/sfloader/fluid_defsfont.c \
           src/sfloader/fluid_ramsfont.c \
           src/rvoice/fluid_adsr_env.c \
           src/rvoice/fluid_chorus.c \
           src/rvoice/fluid_iir_filter.c \
           src/rvoice/fluid_lfo.c \
           src/rvoice/fluid_rvoice.c \
           src/rvoice/fluid_rvoice_dsp.c \
           src/rvoice/fluid_rvoice_event.c \
           src/rvoice/fluid_rvoice_mixer.c \
           src/rvoice/fluid_rev.c \
           src/synth/fluid_chan.c \
           src/synth/fluid_event.c \
           src/synth/fluid_gen.c \
           src/synth/fluid_mod.c \
           src/synth/fluid_synth.c \
           src/synth/fluid_tuning.c \
           src/synth/fluid_voice.c \
           src/midi/fluid_midi.c \
           src/midi/fluid_midi_router.c \
           src/midi/fluid_seqbind.c \
           src/midi/fluid_seq.c \
           src/drivers/fluid_adriver.c \
           src/drivers/fluid_mdriver.c \
           src/drivers/fluid_aufile.c \
           src/bindings/fluid_cmd.c \
           src/bindings/fluid_ladspa.c \
           src/bindings/fluid_filerenderer.c

linux{
    CONFIG += link_pkgconfig

    #pulseaudio
    PKGCONFIG += libpulse \
                 libpulse-mainloop-glib
    DEFINES += PULSE_SUPPORT=1
    SOURCES += src/drivers/fluid_pulse.c
    LIBS +=
    #alsa
    DEFINES += ALSA_SUPPORT=1
    SOURCES += src/drivers/fluid_alsa.c
    LIBS += -lasound
}

unix{
    #oss
    DEFINES += OSS_SUPPORT=1
    SOURCES += src/drivers/fluid_oss.c
}

mac{
    #CoreAudio
    DEFINES += WITHOUT_SERVER=1 COREAUDIO_SUPPORT=1

    SOURCES += src/drivers/fluid_coreaudio.c

    osx{
        #CoreMidi
        DEFINES += COREMIDI_SUPPORT=1
        SOURCES += src/drivers/fluid_coremidi.c
    }

}

win32{
    DEFINES += DSOUND_SUPPORT=1 WINMIDI_SUPPORT=1
    SOURCES += src/fluid_dll.c \
               src/drivers/fluid_dsound.c \
               src/drivers/fluid_winmidi.c
}


INCLUDEPATH += include \
               src \
               src/drivers \
               src/synth \
               src/rvoice \
               src/midi \
               src/utils \
               src/sfloader \
               src/bindings

