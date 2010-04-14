class String
  #deletes the given character out of a string
  def delete_item(letter)
    a = self.split(//)
    a.delete_at(a.index(letter))
    return a.join
  end
end

class Permutate
  def initialize
    @permutations = []
  end

  #lists all permutations of a given string in an array
  def list_arrangements(word)
    word.each_char {|letter|
      permutations(letter, word.delete_item(letter))}
    temp = @permutations.uniq
    @permutations = []
    return temp
  end

  #recursively returns the permutations of a letter and a given string
  def permutations(recurse, word)
    if word.length <= 1
      @permutations << recurse + word
    else
      word.each_char {|letter|
        permutations(recurse + letter, word.delete_item(letter))}
    end
  end
end

require 'test/unit'
class Test_String < Test::Unit::TestCase
  def test1
    assert_equal("hllo","hello".delete_item("e"))
  end
end

class Test_Permute < Test::Unit::TestCase
  def test1
    p = Permutate.new
    assert_equal(["A"],p.list_arrangements("A"))
    assert_equal(["AB", "BA"],p.list_arrangements("AB"))
    assert_equal(["ABB", "BAB", "BBA"],p.list_arrangements("ABB"))
    assert_equal(["ABC", "ACB", "BAC", "BCA", "CAB", "CBA"],p.list_arrangements("ABC"))
  end
end

def display
  puts "Permutations of ABC, and 1234:\n"
  p = Permutate.new
  puts p.list_arrangements("ABC")
  puts p.list_arrangements("1234")
end

display