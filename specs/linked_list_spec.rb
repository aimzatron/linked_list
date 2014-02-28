require './linked_list'
  describe LinkedList do
    before(:each) do
      @list = LinkedList.new()
      @list.add('a')
    end

    it "adds an element" do
      @list.add('b')
      expect(@list.last).to eq 'b'
    end

    it "adds additional elements to the end of the list" do
      @list.add('b')
      @list.add('c')
      expect(@list.last).to eq 'c'
    end

    it "removes a given element from the list" do
      @list.add('b')
      @list.add('c')
      @list.remove('b')
      expect(@list.first).to eq 'a'
      expect(@list.last).to eq 'c'
    end

    it "finds a given element" do
      @list.add('b')
      @list.add('c')
      @list.add('d')

      expect(@list.find('c')).to eq 'c'
    end

    it "iterates over each item" do
      @list.add('b')
      @list.add('c')

      str = ''
      @list.each{|l| str += l}
      expect(str).to eq 'abc'
    end

  end
