// clang-format off
#include <memory>
#include <functional>

#include "stdmemory.h"

#include "gmock/gmock.h"
#include "gtest/gtest.h"
// clang-format on

struct Tracer {
  Tracer()
      : _f([]() {} ) {
  }

  explicit Tracer(std::function<void()>&& f)
      :_f(std::move(f)) {}

  ~Tracer() {
    _f();
  }

  std::function<void()> _f;
};

using namespace std;

TEST(stdmemory, scoped_dtor) {
  // Show that the allocated object was destructed by scope

  int destroyed = 0;

  {
    auto ptr = make_unique<Tracer>([&]() { ++destroyed; } );
  }

  EXPECT_TRUE(destroyed == 1);
}

TEST(stdmemory, scoped_dtor_array) {
  // Show that the allocated object was destructed by scope
  int destroyed = 0;
  {
    unique_ptr<Tracer[]> tracers = make_unique<Tracer[]>(10);
    for (int i=0; i < 10; ++i) {
        tracers[i]._f = [&]() { ++destroyed; };
    }
  }

  EXPECT_TRUE(destroyed == 10);
}

TEST(stdmemory, array_buffer_allocates_zeroed) {
  char buffer[4096];
  memset(buffer, 0, 4096);

  auto p = make_unique<unsigned char[]>(4096);

  EXPECT_TRUE(memcmp(p.get(), buffer, 4096) == 0);
}
