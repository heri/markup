
# WHAT

Install [`ruby 2.2.3`](https://rvm.io/rvm/install)

Get code:
```
git clone https://github.com/heri/markup.git
```

Install gems:
```
bundle install
```

# RUN

Test:

```
ruby product_test.rb 
Loaded suite product_test
Started
.......

Finished in 0.001374 seconds.
-----------------------------------------------------------------------------------------------------------------
7 tests, 10 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
-----------------------------------------------------------------------------------------------------------------
5094.61 tests/s, 7278.02 assertions/s

```

Benchmark

```
10_000.times.sum { Benchmark.ms { Product.final_cost(base_price: 12, workers: 0, category: 'books') } } 
```

# INFO

[heri](http://twitter.com/heri) heri@studiozenkai.com