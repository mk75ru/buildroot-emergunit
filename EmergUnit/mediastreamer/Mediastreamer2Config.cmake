############################################################################
# Mediastreamer2Config.cmake
# Copyright (C) 2015  Belledonne Communications, Grenoble France
#
############################################################################
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
############################################################################
#
# Config file for the mediastreamer2 package.
# It defines the following variables:
#
#  MEDIASTREAMER2_FOUND - system has mediastreamer2
#  MEDIASTREAMER2_INCLUDE_DIRS - the mediastreamer2 include directory
#  MEDIASTREAMER2_LIBRARIES - The libraries needed to use mediastreamer2
#  MEDIASTREAMER2_CPPFLAGS - The compilation flags needed to use mediastreamer2
#  MEDIASTREAMER2_LDFLAGS - The linking flags needed to use mediastreamer2


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was Mediastreamer2Config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include(CMakeFindDependencyMacro)

include("${CMAKE_CURRENT_LIST_DIR}/Mediastreamer2Targets.cmake")

if(ON)
	set(MEDIASTREAMER2_TARGETNAME mediastreamer)
	set(MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_TARGETNAME})
else()
	set(MEDIASTREAMER2_TARGETNAME mediastreamer-static)
	if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
		set(MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_TARGETNAME})
	else()
		get_target_property(MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_TARGETNAME} LOCATION)
	endif()
	get_target_property(MEDIASTREAMER2_LIBRARIES ${MEDIASTREAMER2_TARGETNAME} INTERFACE_LINK_LIBRARIES)
endif()

get_target_property(MEDIASTREAMER2_INCLUDE_DIRS ${MEDIASTREAMER2_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)

set(MEDIASTREAMER2_INCLUDE_DIRS "")

set(MEDIASTREAMER2_CPPFLAGS )
set(MEDIASTREAMER2_LDFLAGS "")
set(MEDIASTREAMER2_FOUND 1)

get_target_property(MEDIASTREAMER2_FRAMEWORK_IDENTIFIER ${MEDIASTREAMER2_TARGETNAME} MACOSX_FRAMEWORK_IDENTIFIER)

set(MEDIASTREAMER2_PLUGINS_LOCATION "lib/mediastreamer/plugins")

