class Link
  attr_accessor :value, :tail, :head

  def initialize(value, head=nil)
    @value = value
    @head = head
  end

  def add(value)
    if self.last?
      self.tail = Link.new(value, self)
    else
      self.tail.add(value)
    end
  end

  def remove(value)
    if self.value != value
      self.find(value).remove(value)
    else
      puts "#{self.value} : #{self.head} : #{self.tail}"
      self.tail.head = self.head unless self.last?
      self.head.tail = self.tail unless self.first?
    end  
  end

  def find(value)
    if self.value == value
       self
    else
      self.tail.find(value)
    end
  end

  def first?
    self.head.nil?
  end

  def last?
    self.tail.nil?
  end

  def each(&block)
    yield(self)
    self.tail.each &block unless self.last?
  end

end