module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |el|
      return false unless yield el
    end
    true
  end

  def my_any?
    truthy = 0
    self.my_each do |el|
      if yield el 
        truthy += 1  
      end
    end
    truthy > 0
  end

  def my_map
    array = []
    self.my_each do |el|
      processed = yield el
      array << processed
    end
    array
  end

  def my_count
    i = 0
    self.my_each { |el| i += 1 }
    return i unless block_given?

    i = 0
    self.my_each do |el|
      truthy = yield el
      unless truthy == false
        i += 1
      end
    end
    i
  end

  def my_none?
    self.my_each do |el|
      return false if yield el
    end
    true
  end


  def my_inject(value)
    answer = 0
    total = 0
    i = 0
    length = self.my_count

    self.my_each do |el| 
      if i == 0
        total = el
      else
        unless i == length
          total = yield el, total
        end
        answer = yield value, total
      end
      i += 1
    end
    answer
  end

  def my_each_with_index
    i = 0
    self.my_each do |el|
      new_el = yield el, i
      i += 1
    end
  end

  def my_select
    array_return = []
    self.each do |el|
      array_return << el if yield el
    end
    array_return
  end
end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for el in self
      yield el
    end
  end
end

