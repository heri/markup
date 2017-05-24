
# WHAT

Install [`ruby 2.2.3`](https://rvm.io/rvm/install) or more recent

Get code:
```
git clone https://github.com/heri/markup.git
```

Install gems:
```
cd markup && bundle install
```

# RUN

Test:

```
ruby product_test.rb 
Loaded suite product_test
Started
.......

Finished in 0.001809 seconds.
-----------------------------------------------------------------------------------------------------------------
7 tests, 15 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
-----------------------------------------------------------------------------------------------------------------
3869.54 tests/s, 8291.87 assertions/s

```

To have an idea of performance, launch `irb` console then:

```
require 'benchmark'
require_relative 'product'
Benchmark.bm {|x| x.report { 1_000_000.times do; Product.final_cost(base_price: 12, workers: 3, category: 'books'); end; } }
```

# INFO

[heri](http://twitter.com/heri) heri@studiozenkai.com