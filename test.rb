#/usr/bin/env ruby
require 'benchmark/ips'
 
Benchmark.ips do |x|
x.config(time: 5, warmup: 2)
 
def block_call &block
block.call
end
 
def block_yield
yield
end
 
x.report("block call") { block_call {} }
x.report("block yield") { block_yield {} }
x.report("proc call") { proc {}.call }
x.report("lambda call") { -> {}.call }
x.report("call Lambda as block") { block_call &->{} }
x.report("yield lambda as block") { block_yield &->{} }
end
