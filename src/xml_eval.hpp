// xmleval - A toy XML scripting language
// Copyright (C) 2004 Ingo Ruhnke <grumbel@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#ifndef HEADER_XML_EVAL_HXX
#define HEADER_XML_EVAL_HXX

namespace xmleval {

void eval(const CL_DomNode& cur);
void eval_block(CL_DomNode cur);
int  lookup(const std::string& name);

} // namespace xmleval

#endif

/* EOF */
