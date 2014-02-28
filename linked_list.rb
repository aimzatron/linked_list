require './link.rb'
class LinkedList
  attr_accessor :first_link

  def initialize()
  end

  def add(value)
    if first_link.nil?
      self.first_link = Link.new(value)
    else
      first_link.add(value)
    end
  end

  def remove(value)
    first_link.remove(value)
  end

  def find(value)
    first_link.find(value).value
  end

  def first
    first_link.each do |link|
      return link.value if link.first?
    end
  end

  def last
    first_link.each do |link|
      return link.value if link.last?
    end
  end

  def each(&block)
    self.first_link.each{|l| yield l.value } rescue nil
  end

end