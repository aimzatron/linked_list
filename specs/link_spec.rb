require './link'
  describe Link do
    before(:each) do
      @link = Link.new('a')
    end

    it "stores a value" do
      expect(@link.value).to eq 'a'
    end

    it "adds an element" do
      b = @link.add('b')
      expect(b.head).to eq @link
      expect(@link.tail).to eq b
    end

    it "returns the tail element" do
      @link.add('b')
      expect(@link.tail.value).to eq 'b'
    end

    it "adds additional elements to the end of the list" do
      @link.add('b')
      @link.add('c')
      expect(@link.tail.tail.value).to eq 'c'
    end

    it "removes a given element from the list" do
      @link.add('b')
      @link.add('c')
      @link.remove('b')
      expect(@link.value).to eq 'a'
      expect(@link.tail.value).to eq 'c'
      expect(@link.tail.tail).to be_nil
    end

    it "finds a given element" do
      @link.add('b')
      @link.add('c')
      @link.add('d')

      expect(@link.find('c').value).to eq 'c'
    end

    it "knows when it's the last link" do
      @link.add('b')

      expect(@link.last?).to be_false
      expect(@link.tail.last?).to be_true
    end

    it "iterates over each item" do
      @link.add('b')
      @link.add('c')

      str = ''
      @link.each{|l| str += l.value}
      expect(str).to eq 'abc'
    end

    it "can check if it is first" do
      @link.add('b')
      @link.add('c')

      expect(@link.first?).to be_true
      expect(@link.tail.first?).to be_false
      expect(@link.tail.tail.first?).to be_false
    end

  end
