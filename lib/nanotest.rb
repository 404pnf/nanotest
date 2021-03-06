# namespace
module Nanotest
  extend self

  @@failures, @@dots = [], []

  def assert(msg = nil, file = nil, line = nil, stack = caller, &block)
    if !block.call
      f, l = stack.first.match(/(.*):(\d+)/)[1..2]
      @@failures << format('(%s:%0.3d) %s', file || f, line || l, msg || 'assertion failed')
      @@dots << 'F'
    else
      @@dots << '.'
    end
  end

  def self.results #:nodoc:
    @@dots.join + "\n" + @@failures.join("\n")
  end

  at_exit do
    puts results unless results.strip.empty?
    exit @@failures.empty?
  end
end
