////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///
///	Copyright (C) 2019 by Company Inc.
///
///	This file is part of the . project.
///
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///	@file						./Main.test.cxx
///	@author						Bob Marley <bob@marley.com>
///	@date						26 Feb 2019

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include <Setup.test.hpp>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int 							main 										(			int							argc,
																						char**						argv								)
{

	::testing::InitGoogleTest(&argc, argv) ;

	::testing::AddGlobalTestEnvironment(new .::test::Environment(argc >= 2 ? argv[1] : "")) ;
	
	return RUN_ALL_TESTS() ;

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////