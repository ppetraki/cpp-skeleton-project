// clang-format off
#include <iostream>

#include "gmock/gmock.h"
#include "gtest/gtest.h"
// clang-format on

TEST( Example, Example1 )
{
  std::cout << "Example1" << std::endl;
  EXPECT_TRUE( 1 == 1 );
}
