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

#include "xml_eval.hpp"

int main(int argc, char** argv)
{
  if (argc !=  2)
  {
    std::cout << "Usage: " << argv[0] << " FILENAME" << std::endl;
    return 1;
  }
  else
  {
    try
    {
      CL_SetupCore::init();

      std::string filename = argv[1];
      CL_DomDocument dom(new CL_InputSource_File(filename), true);

      CL_DomNode cur = dom.get_document_element();

      xmleval::eval(cur);

      CL_SetupCore::deinit();
    }
    catch (CL_Error& err)
    {
      std::cout << "CL_Error: " << err.message << std::endl;
    }
    return 0;
  }
}

/* EOF */
