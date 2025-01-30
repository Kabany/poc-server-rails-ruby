module OperationsHelper

  def create_list(times)
    @list = []
    if times <= 0
      return @list
    end
    for i in 1..times
      @list.push({id: i, message: "This is the message number #{i}"})
    end
    return @list
  end

  def fibonacci_sum(n)
    @fib = []
    if n <= 0
      return 0
    elsif n == 1
      return 1
    end
    @fib.push(0)
    @fib.push(1)
    @sum = @fib[0] + @fib[1]
    for i in 2..n
      @fib[i] = @fib[i - 1] + @fib[i - 2]
      @sum += @fib[i]
    end
    return @sum
  end

  def fibonacci_list(n)
    @fib = []
    if n < 0
      return []
    elsif n == 0
      return [0]
    end
    @fib.push(0)
    @fib.push(1)
    if n == 1
      return @fib
    end
    for i in 2..n
      @fib[i] = @fib[i - 1] + @fib[i - 2]
    end
    return @fib
  end
end