# This maintains the links for all sources used by this superbuild.
# Simply update this file to change the revision.
# One can use different revision on different platforms.
# e.g.
# if (UNIX)
#   ..
# else (APPLE)
#   ..
# endif()

add_revision(zlib
  URL "http://www.paraview.org/files/dependencies/zlib-1.2.7.tar.gz"
  URL_MD5 60df6a37c56e7c1366cca812414f7b85)

if (WIN32)
  if (64bit_build)
    add_revision(ffmpeg
      URL "http://paraview.org/files/dependencies/ffmpeg-kitware-20150514gitbc25918-win64.tar.bz2"
      URL_MD5 887217ae04ee9004e2ec121442553259)
  else ()
    add_revision(ffmpeg
      URL "http://paraview.org/files/dependencies/ffmpeg-kitware-20150514gitbc25918-win32.tar.bz2"
      URL_MD5 b8b3068699e272789ca02df5c132c05c)
  endif ()
else ()
  add_revision(ffmpeg
    URL "http://paraview.org/files/dependencies/ffmpeg-2.3.3.tar.bz2"
    URL_MD5 72361d3b8717b6db3ad2b9da8df7af5e)
endif ()

add_revision(python
  GIT_REPOSITORY "https://github.com/python-cmake-buildsystem/python-cmake-buildsystem.git"
  GIT_TAG "b012e1e718250b8d94256beca97dcbca24d463db")

foreach (fftw3kind float double long quad)
  add_revision(fftw3${fftw3kind}
    URL "http://www.paraview.org/files/dependencies/fftw-3.3.4.tar.gz"
    URL_MD5 2edab8c06b24feeb3b82bbb3ebf3e7b3)
endforeach ()

if (WIN32)
  if (64bit_build)
    add_revision(pyfftw
      URL "http://www.tomviz.org/files/pyFFTW-0.9.2-win64.zip"
      URL_MD5 "")
  else()
    add_revision(pyfftw
      URL "http://www.tomviz.org/files/pyFFTW-0.9.2-win32.zip"
      URL_MD5 "")
  endif()
else()
  add_revision(pyfftw
    URL "http://www.paraview.org/files/dependencies/pyFFTW-0.9.2.tar.gz"
    URL_MD5 34fcbc68afb8ebe5f040a02a8d20d565)
endif()

add_revision(qt
  URL "http://www.paraview.org/files/dependencies/qt-everywhere-opensource-src-4.8.6.tar.gz"
  URL_MD5 2edbe4d6c2eff33ef91732602f3518eb)

# Default to build from a known ParaView revision
option(USE_PARAVIEW_MASTER "Use ParaView master instead of known ref" OFF)
if(USE_PARAVIEW_MASTER)
  set(_paraview_revision "master")
else()
  # Test the revision with OpenGL2 rendering before updating, update often!
  set(_paraview_revision "64808f36b65b3f6dba1186148f3782dc7d5dee29")
endif()
add_revision(paraview
  GIT_REPOSITORY "https://gitlab.kitware.com/paraview/paraview.git"
  GIT_TAG "${_paraview_revision}")

option(tomviz_FROM_GIT "If enabled then the repository is fetched from git" ON)
cmake_dependent_option(tomviz_FROM_SOURCE_DIR OFF
  "Enable to use existing tomviz source."
  "NOT tomviz_FROM_GIT" OFF)

if (tomviz_FROM_GIT)
  # Download tomviz from GIT
  add_customizable_revision(tomviz
    GIT_REPOSITORY https://github.com/OpenChemistry/tomviz.git
    GIT_TAG "master")
else()
  if (tomviz_FROM_SOURCE_DIR)
    add_customizable_revision(tomviz
      SOURCE_DIR "TomvizSource")
  else()
    message(FATAL_ERROR "No stable source tarball URL")
  endif()
endif()

add_revision(lapack
  URL "http://paraview.org/files/dependencies/lapack-3.4.2.tgz"
  URL_MD5 61bf1a8a4469d4bdb7604f5897179478)

if (WIN32)
  if (64bit_build)
    add_revision(numpy
      URL "http://www.paraview.org/files/dependencies/numpy-1.8.1-intel-win64.zip"
      URL_MD5 "b50c54abca1e2422fec408a4a56529ec")
    add_revision(scipy
      URL "http://www.paraview.org/files/dependencies/scipy-0.15.1-intel-win64.zip"
      URL_MD5 "39bc38f18703219a73cec496fc557c64")
    add_revision(intelredist
      URL "http://paraview.org/files/dependencies/intel-psxe2015-64-bit-redist.zip"
      URL_MD5 1920a6c593c454ce0f4258aabf5aefe5)
  else ()
    add_revision(numpy
      URL "http://www.paraview.org/files/dependencies/numpy-1.8.1-intel-win32.zip"
      URL_MD5 "1a436259d025f0b8272d6539e0444e76")
    add_revision(scipy
      URL "http://www.paraview.org/files/dependencies/scipy-0.15.1-intel-win32.zip"
      URL_MD5 "52fadb6cc8f04c1505996df8d361a686")
    add_revision(intelredist
      URL "http://paraview.org/files/dependencies/intel-psxe2015-32-bit-redist.zip"
      URL_MD5 a35b9f31ffeb395861680815a59a2077)
  endif ()
else()
  add_revision(numpy
    URL "http://paraview.org/files/dependencies/numpy-1.8.1+cmake+static.tar.bz2"
    URL_MD5 1974dbb4bfa1509e492791a8cd225774)

  add_revision(scipy
    URL "http://www.paraview.org/files/dependencies/scipy-0.15.1.tar.gz"
    URL_MD5 be56cd8e60591d6332aac792a5880110)
endif()

if (WIN32)
  if (64bit_build)
    add_revision(itk
      URL "http://www.tomviz.org/files/itk-4.8.2-windows-64bit.zip"
      URL_MD5 "93f07c9cad4514d1bd0f29261f14ccf7")
    add_revision(fftw
      URL "http://www.tomviz.org/files/fftw-3.3.4-windows-64bit.zip"
      URL_MD5 "90ca2a2cd26c62bc85b11ec7f165e716")
  else()
    add_revision(itk
      URL "http://www.tomviz.org/files/itk-4.8.2-windows-32bit.zip"
      URL_MD5 "ac2c96df3e844173ef7f8dbd0b21f4c5")
    add_revision(fftw
      URL "http://www.tomviz.org/files/fftw-3.3.4-windows-32bit.zip"
      URL_MD5 "9f58e109b8e7dcdd5640f9397735dd26")
  endif()
elseif(APPLE)
  add_revision(itk
    URL "http://www.tomviz.org/files/itk-4.8.2-macosx10.8.tar.gz"
    URL_MD5 "39e75f16fb430818ade23a0439334cd0")
elseif(UNIX)
  add_revision(itk
    URL "http://www.tomviz.org/files/itk-4.8.2-linux-64bit.tar.gz"
    URL_MD5 "5830edef507874ab531b6e33eb3e79d7")
endif()

set(tbb_ver "44_20150728oss")
if (WIN32)
  set(tbb_file "tbb${tbb_ver}_win.zip")
  set(tbb_md5 "e7bbf293cdb5a50ca81347c80168956d")
elseif (APPLE)
  set(tbb_file "tbb${tbb_ver}_osx.tgz")
  set(tbb_md5 "a767d7a8b375e6b054e44e2317d806b8")
else ()
  set(tbb_file "tbb${tbb_ver}_lin_0.tgz")
  set(tbb_md5 "ab5df80a65adf423b14637a1f35814b2")
endif ()

add_revision(tbb
  URL "http://www.paraview.org/files/dependencies/${tbb_file}"
  URL_MD5 "${tbb_md5}")

