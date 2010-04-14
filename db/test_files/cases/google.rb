require 'rubygems'
require 'test/unit'
require 'watir'

# A simple test case using google
class TC_Google < Test::Unit::TestCase
  def test_0010_goto
    # Start an IE instance:
    $ie = Watir::IE.new  # IE instance, stored in a global variable
    address = 'http://www.google.com'
    $ie.goto(address)
    assert($ie.contains_text("About Google"))
  end
  def test_0020_search
    $ie.text_field(:name, 'q').set('pickaxe')
    $ie.button(:value, 'Google Search').click()
    assert($ie.contains_text("ruby"))
    $ie.close
  end
end
