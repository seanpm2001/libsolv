
FIND_PATH(CHECK_INCLUDE_DIR NAMES check.h)
MARK_AS_ADVANCED(CHECK_INCLUDE_DIR)

# Look for the library.
FIND_LIBRARY(CHECK_LIBRARY NAMES check)
MARK_AS_ADVANCED(CHECK_LIBRARY)

# Copy the results to the output variables.
IF(CHECK_INCLUDE_DIR AND CHECK_LIBRARY)
  SET(CHECK_FOUND 1)
  SET(CHECK_LIBRARIES ${CHECK_LIBRARY})
  SET(CHECK_INCLUDE_DIRS ${CHECK_INCLUDE_DIR})
ELSE(CHECK_INCLUDE_DIR AND CHECK_LIBRARY)
  SET(CHECK_FOUND 0)
  SET(CHECK_LIBRARIES)
  SET(CHECK_INCLUDE_DIRS)
ENDIF(CHECK_INCLUDE_DIR AND CHECK_LIBRARY)

# Report the results.
IF(NOT CHECK_FOUND)
  SET(CHECK_DIR_MESSAGE
    "check C unit testing library was not found. Install check and check-devel.")
  IF(NOT CHECK_FIND_QUIETLY)
    MESSAGE(STATUS "${CHECK_DIR_MESSAGE}")
  ELSE(NOT CHECK_FIND_QUIETLY)
    IF(CHECK_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "${CHECK_DIR_MESSAGE}")
    ENDIF(CHECK_FIND_REQUIRED)
  ENDIF(NOT CHECK_FIND_QUIETLY)
ELSE(NOT CHECK_FOUND)
  MESSAGE(STATUS "check C unit testing library: ${CHECK_LIBRARIES}")
ENDIF(NOT CHECK_FOUND)
