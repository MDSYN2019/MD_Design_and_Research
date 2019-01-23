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

//---------------------------------------------------------------------------//
//                                                                           //
// LinearSubdivider.  This class takes a range of values and divides it    //
// up in a way that is appropriate for linear scales.                        //
//                                                                           //
//                                                                           //
//                                                                           //
//---------------------------------------------------------------------------//
#ifndef _LinearSubdivider_h_
#define _LinearSubdivider_h_
#include "QatPlotWidgets/AbsRangeDivider.h"
#include <vector>
class LinearSubdivider:public AbsRangeDivider {
  
public:

  // Constructor
  LinearSubdivider();

  // Destructor
  virtual ~LinearSubdivider();

  // Three methods to set the range.  The calling the first method once
  // is more efficient than calling the last methods twice!
  virtual void setRange(double min, double max);
  virtual void setMin(double min);
  virtual void setMax(double max);

  // Get the number of subdivisions:
  virtual int getNumSubdivisions() const;

  // Get the location of each subdivision:
  virtual const RangeDivision & getSubdivision(int i) const;

 // Get the validity of each subdivision:
  virtual bool isValid(int i) const;

private:

  double                     _min;
  double                     _max;
  std::vector<RangeDivision> _subdivision;
  void                       _recompute();
  
};
#endif
