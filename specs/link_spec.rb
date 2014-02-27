require './link'
  describe Link do
    before(:each) do
      @link = Link.new('a')
    end

    it "stores a value" do
      expect(@link.value).to eq 'a'
    end

    it "adds an element" do
      expect(@link.add('b').value).to eq 'b'
    end

    it "returns the next element" do
      @link.add('b')
      expect(@link.next.value).to eq 'b'
    end

    it "adds additional elements to the end of the list" do
      @link.add('b')
      @link.add('c')
      expect(@link.next.next.value).to eq 'c'
    end

    it "removes a given element from the list" do
      @link.add('b')
      @link.add('c')
      @link.remove('b')
      expect(@link.value).to eq 'a'
      expect(@link.next.value).to eq 'c'
      expect(@link.next.next).to be_nil
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
      expect(@link.next.last?).to be_true
    end

    it "iterates over each item" do
      @link.add('b')
      @link.add('c')

      str = ''
      @link.each{|l| str += l.value}
      expect(str).to eq 'abc'
    end

  end
