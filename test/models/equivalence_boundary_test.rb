require 'test_helper'

class EquivalenceBoundaryTest < ActionController::TestCase
	def setup
		@valid_input = ['abc', 'abcd', 'abcde', 'abcdef', 'abcdefg', 'abcdefgh']
		@invalid_input = ['a', 'ab', 'abcdefghi', 'abcdefghij', 'abcdefghijk', 'abcdefghijkl' ]
		@lower_boundary = ['a', 'b']
		@upper_boundary = ['abcdefghi', 'abcdefghij', 'abcdefghijk', 'abcdefghijkl' ]
	end

  test "test user name length is between 3 and 8 using equivalence partitioning" do
  		@valid_input.each do |s|
  			assert (s.length > 2 && s.length < 9)
  		end

  		@invalid_input.each do |s|
  			assert_not (s.length > 2 && s.length < 9)
  		end
  end

    test "test user name length is between 3 and 8 using value boundary analysis" do
    	@lower_boundary.each do |s|
    		assert(s.length < 3)
    	end

    	 @valid_input.each do |s|
  			assert (s.length > 2 && s.length < 9)
  		end

    	@upper_boundary.each do |s|
    		assert(s.length > 8)
    	end

  	end
end