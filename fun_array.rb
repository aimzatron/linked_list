require './link.rb'
require 'pry'

class FunArray
  attr_accessor :first_link

  def initialize(value=nil)
    self.first_link = Link.new(value) unless value.nil?
  end

  def build_or_get_first_link(item=nil)
    self.first_link ||= Link.new(item)
  end

  def []=(index, value)
    link = self.build_or_get_first_link
    count = 0

    while count < index
      if link.last?
        link = link.add(nil)
      else
        link = link.next
      end
        count += 1
    end
    link.value = value
  end

  def [](index)
    return nil if self.empty?

    link = self.first_link
    count =0

    while count < index
      return nil if link.last?
      link = link.next
      count += 1
    end

    link.value
  end

  def size
    count = 0

    self.first_link.each do |l|
      count += 1
    end rescue nil
    count
  end

  def empty?
    self.size == 0
  end

  def <<(item)
    if self.first_link.nil?
      self.build_or_get_first_link(item)
    else
      self.first_link.add(item)
    end
  end

  alias_method :push, :<<

  def rotate
    link = self.first_link.next
    rotated = FunArray.new

    link.each do |l|
      rotated << l.value
    end

    rotated << self.first_link.value
    rotated
  end

  def rotate!
    rotated = self.rotate

    self.first_link = rotated.first_link

    self
  end

  def first
    self.first_link.value rescue nil
  end

  def last
    self[self.size - 1] rescue nil
  end

  def each(&block)
    self.first_link.each{|l| yield l.value } rescue nil
  end

  def swap!(index1, index2)
    value1 = self[index1]
    self[index1] = self[index2]
    self[index2] = value1
    self
  end

  def copy 
    copied = FunArray.new
    self.each{ |e| copied << e } 
    copied
  end

  def swap(index1, index2)
    copy.swap!(index1, index2)
  end

  def to_s
    str = ''
    self.each{|i| str << "#{i.to_s}," }
    str.chop
  end

  def pop(item)
    self.each do |i|
      if i == item
        self.first_link.remove(item)
      end
    end
  end

end