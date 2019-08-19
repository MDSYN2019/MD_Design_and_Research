//---------------------------------------------------------------------------//
// !!                                                                     !! //
//                                                                           //
//  Copyright (C) 2016 Joe Boudreau                                          //
//                                                                           //
//  This file is part of the QAT Toolkit for computational science           //
//                                                                           //
//  QAT is free software: you can redistribute it and/or modify              //
//  it under the terms of the GNU Lesser General Public License as           //
//  published by the Free Software Foundation, either version 3 of           //
//  the License, or (at your option) any later version.                      //
//                                                                           //
//  QAT is distributed in the hope that it will be useful,                   //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of           //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            //
//  GNU Lesser General Public License for more details.                      //
//                                                                           //
//  You should have received a copy of the GNU Lesser General Public         //
//  License along with QAT.  If not, see <http://www.gnu.org/licenses/>.     //
//                                                                           //
//---------------------------------------------------------------------------//

#include "QatDataAnalysis/RCSBase.h"

RCSBase::RCSBase()
      : _count(0)
{
}


RCSBase::~RCSBase()
{
}



void RCSBase::ref() const
{
  _count++;
}

void RCSBase::unref() const
{
  if (!_count)
    {

    }
  else
    {
      _count--;
      if (_count==1) uncache();
      if (!_count) delete this;
    }
  
}

unsigned int RCSBase::refCount() const
{
  return _count;
}

void RCSBase::uncache() const {
}


