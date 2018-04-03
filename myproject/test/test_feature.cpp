// clang-format off
#include "gmock/gmock.h"
#include "gtest/gtest.h"

// for native thread_id
#include <sys/types.h>
#include <sys/syscall.h>

#include <cstddef>
#include <algorithm>
#include <atomic>
#include <chrono>
#include <future>
#include <iostream>
#include <sstream>
#include <string>
#include <type_traits>
#include <functional>
#include <numeric>
#include <memory>
#include <vector>
// clang-format on

TEST( Feature, Sample1 )
{
  std::cout << "Sample1" << std::endl;
  EXPECT_TRUE( 1 == 1 );
}
