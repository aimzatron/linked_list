class Link
  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

  def add(value)
    if self.last?
      self.next = Link.new(value)
    else
      self.next.add(value)
    end
  end

  def remove(value)
    if self.value == value
      self.value = self.next.value
      self.next = self.next.next
    else
      self.next.remove(value)
    end
  end

  def find(value)
    if self.value == value
       self
    else
      self.next.find(value)
    end
  end

  def last?
    self.next.nil?
  end

  def each(&block)
    yield(self)
    self.next.each &block unless self.last?
  end

end