enable_testing()

set(BINARY ${CMAKE_PROJECT_NAME}_test)

set(TEST_SOURCES main.cxx solution_test.cxx)
set(SOURCES ${TEST_SOURCES})

add_executable(${BINARY} ${TEST_SOURCES})

add_test(NAME ${BINARY} COMMAND ${BINARY})

target_link_libraries(${BINARY} PUBLIC ${CMAKE_PROJECT_NAME}_lib gtest)

include(GoogleTest)
gtest_discover_tests(${BINARY})
