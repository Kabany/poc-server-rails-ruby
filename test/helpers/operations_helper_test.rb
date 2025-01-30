require "test_helper"

class OperationsHelperTest < ActiveSupport::TestCase
  include OperationsHelper

  test "Should create a list of items with a number and a string as parameters" do
    @list = create_list(1000)
    assert_equal(1000, @list.length())
    # First item
    assert_equal(1, @list[0][:id])
    assert_equal("This is the message number 1", @list[0][:message])
    # 100th item
    assert_equal(100, @list[99][:id])
    assert_equal("This is the message number 100", @list[99][:message])
    # 1000th item
    assert_equal(1000, @list[999][:id])
    assert_equal("This is the message number 1000", @list[999][:message])
  end

  test "Should aggregate the items of the fibbonacci sequence" do
    assert_equal(0, fibonacci_sum(-1))
    assert_equal(0, fibonacci_sum(0))
    assert_equal(1, fibonacci_sum(1))
    assert_equal(2, fibonacci_sum(2))
    assert_equal(4, fibonacci_sum(3))
    assert_equal(7, fibonacci_sum(4))
    assert_equal(12, fibonacci_sum(5))
    assert_equal(143, fibonacci_sum(10))
    assert_equal(32951280098, fibonacci_sum(50))
    assert_equal(927372692193078999175, fibonacci_sum(100))
  end

  test "Should return a list of fibbonacci sequence" do
    assert_equal(0, fibonacci_list(-1).length())
    @list0 = fibonacci_list(0)
    assert_equal(1, @list0.length())
    assert_equal(0, @list0[0])
    @list1 = fibonacci_list(1)
    assert_equal(2, @list1.length())
    assert_equal(1, @list1[1])
    @list2 = fibonacci_list(2)
    assert_equal(3, @list2.length())
    assert_equal(1, @list2[2])
    @list3 = fibonacci_list(3)
    assert_equal(4, @list3.length())
    assert_equal(2, @list3[3])
    @list4 = fibonacci_list(4)
    assert_equal(5, @list4.length())
    assert_equal(3, @list4[4])
    @list5 = fibonacci_list(5)
    assert_equal(6, @list5.length())
    assert_equal(5, @list5[5])
    @list6 = fibonacci_list(6)
    assert_equal(7, @list6.length())
    assert_equal(8, @list6[6])
    @list7 = fibonacci_list(10)
    assert_equal(11, @list7.length())
    assert_equal(55, @list7[10])
    @list8 = fibonacci_list(50)
    assert_equal(51, @list8.length())
    assert_equal(12586269025, @list8[50])
    @list9 = fibonacci_list(78)
    assert_equal(79, @list9.length())
    assert_equal(8944394323791464, @list9[78])
    @list10 = fibonacci_list(100)
    assert_equal(101, @list10.length())
    assert_equal(354224848179261915075, @list10[100])
    
    assert_equal(fibonacci_list(300)[300], 222232244629420445529739893461909967206666939096499764990979600)
  end
end