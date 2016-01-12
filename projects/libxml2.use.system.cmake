find_package(LibXml2 REQUIRED)

add_extra_cmake_args(
  -DLIBXML2_INCLUDE_DIR:PATH=${LIBXML2_INCLUDE_DIR}
  -DLIBXML2_LIBRARIES:FILEPATH=${LIBXML2_LIBRARIES}
  -DLIBXML2_XMLLINT_EXECUTABLE:FILEPATH=${LIBXML2_XMLLINT_EXECUTABLE}
)