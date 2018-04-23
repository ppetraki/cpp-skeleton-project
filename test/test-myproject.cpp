// clang-format off
#include <iostream>

#include "gmock/gmock.h"
#include "gtest/gtest.h"
// clang-format on

TEST( myproject, smoke )
{
  std::cout << "gtest boilerplate" << std::endl;
  EXPECT_TRUE( 1 == 1 );
}
