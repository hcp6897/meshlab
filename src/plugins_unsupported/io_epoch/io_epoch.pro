include (../../shared.pri)

TEMPLATE      = lib
CONFIG       += plugin 

FORMS         = ui/v3dImportDialog.ui
HEADERS       += epoch_io.h \
				epoch_reconstruction.h \
				epoch_camera.h \		
				radial_distortion.h\
				v3dImportDialog.h \
				scalar_image.h \
                maskRenderWidget.h \
                maskImageWidget.h \
                fillImage.h
				
SOURCES       += epoch_io.cpp \
                epoch_camera.cpp \
                radial_distortion.cpp \
                scalar_image.cpp \
                v3dImportDialog.cpp \ 
                maskRenderWidget.cpp \
                maskImageWidget.cpp \
                fillImage.cpp \
		$$VCGDIR/wrap/ply/plylib.cpp
                
TARGET        = io_epoch
QT           += xml

win32-msvc2005:LIBS	   += ../../external/lib/win32-msvc2005/bz2.lib
win32-msvc2008:LIBS	   += ../../external/lib/win32-msvc2008/bz2.lib
win32-g++:LIBS	+= ../../external/lib/win32-gcc/libbz2.a
linux-g++:LIBS	+= -lbz2

!CONFIG(system_bz2): INCLUDEPATH  *= ../../external/bzip2-1.0.5

mac:LIBS   += -lbz2

CONFIG(release, debug|release) {
	win32-g++:release:QMAKE_CXXFLAGS -= -O2
	win32-g++:release:QMAKE_CFLAGS -= -O2
	win32-g++:release:QMAKE_CXXFLAGS += -O3 -mtune=pentium3 -ffast-math
}	

