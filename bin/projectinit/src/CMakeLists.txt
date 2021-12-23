set(BINARY ${CMAKE_PROJECT_NAME})

set(SOURCES main.cxx solution.cxx)
set(HEADERS solution.hxx)

add_executable(${BINARY}_run ${SOURCES} ${HEADERS})

add_library(${BINARY}_lib STATIC ${SOURCES})
