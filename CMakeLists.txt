# xmleval - A toy XML scripting language
# Copyright (C) 2015 Ingo Ruhnke <grumbel@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

cmake_minimum_required(VERSION 3.0)
project(xmleval VERSION 0.2.0)

include(GNUInstallDirs)

find_package(PkgConfig REQUIRED)
pkg_search_module(CLANCORE REQUIRED clanCore-1.0 IMPORTED_TARGET)

add_executable(xmleval src/main.cpp src/xml_eval.cpp)
target_include_directories(xmleval PRIVATE src/)
target_link_libraries(xmleval PUBLIC
  PkgConfig::CLANCORE)

install(TARGETS xmleval
  RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}")
install(DIRECTORY "scripts/" DESTINATION "${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/scripts/"
  PATTERN "*~" EXCLUDE)

# EOF #
