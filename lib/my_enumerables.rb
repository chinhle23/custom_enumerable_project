module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    new_array = []
    my_each do |elem|
      new_array << elem if yield(elem)
    end
    new_array
  end

  def my_all?
    my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_count
    if block_given?
      count = 0
      my_each do |elem|
        count += 1 if yield(elem)
      end
      count
    else
      length
    end
  end

  def my_map
    new_array = []
    my_each do |elem|
      new_array << yield(elem)
    end
    new_array
  end

  def my_inject(initial_value)
    total = initial_value
    my_each do |elem|
      total = yield(total, elem)
    end
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end
end
