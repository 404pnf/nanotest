require 'minitest'
require 'minitest/autorun'

class MiniTest::TestCase
  def self.test(name, &block)
    define_method("test_#{name.gsub(/\s/, '_').downcase}", &block)
  end
end
