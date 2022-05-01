module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    x = 0
    while x < self.length
      yield(self[x])
      x += 1
    end
    self
  end

  def my_each_with_index
    x = 0
    while x < self.length
      yield(self[x], x)
      x += 1
    end
    self
  end

  def my_select
    x = 0
    arr = []
    while x < self.length
      if yield(self[x])
        arr.push(self[x])
      end
      x += 1
    end
    arr
  end

  def my_all?
    x = 0
    count = 0
    arr = []
    while x < self.length
      if yield(self[x])
        arr.push(self[x])
      else
        count += 1
      end
      x += 1
    end
    if count == 0
      true 
    else
      false
    end
  end

  def my_any?
    x = 0
    count = 0
    arr = []
    while x < self.length
      if yield(self[x])
        arr.push(self[x])
        count += 1
      end
      x += 1
    end
    if count > 0
      true 
    else
      false
    end
  end

  def my_none?
    x = 0
    count = 0
    arr = []
    while x < self.length
      if yield(self[x])
        arr.push(self[x])
        count += 1
      end
      x += 1
    end
    if count > 0
      false
    else
      true
    end
  end

  def my_count
    x = 0
    count = 0
    while x < self.length
      if block_given? 
        if yield(self[x])
          count += 1
        end
      else
        count += 1
      end
      x += 1
    end
    count
  end

  def my_map
    x = 0
    arr = []
    while x < self.length
      if block_given?
        arr.push(yield(self[x]))
      else
        arr.push(self[x])
      end
      x += 1
    end
    arr
  end

  def my_inject(initial_value)
    x = 0
    value = 0
    while x < self.length
      value = yield(initial_value, self[x])
      initial_value = value
      x += 1
    end
    initial_value
  end
end
