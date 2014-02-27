require './fun_array'
  describe FunArray do
    before(:each) do
      @array = FunArray.new
    end

    it "should store a first item" do
      @array[0] = 'a'

      expect(@array[0]).to eq 'a'
    end

    it "should store a second item" do
      @array[0] = 'a'
      @array[1] = 'b'

      expect(@array[0]).to eq 'a'
      expect(@array[1]).to eq 'b'
    end

    it "allows insertion with random indexes" do
      @array[5] = 'a'

      expect(@array[0]).to be_nil
      expect(@array[5]).to eq 'a'
    end

    it "should change a first item" do
      @array[0] = 'a'
      @array[1] = 'b'

      expect(@array[0]).to eq 'a'
      expect(@array[1]).to eq 'b'

      @array[0] = 'c'

      expect(@array[0]).to eq 'c'
      expect(@array[1]).to eq 'b'
      expect(@array[10]).to be_nil
    end

    it "knows it's size" do
      @array[7] = 'seven'
      @array[8] = 'eight'

      expect(@array.size).to eq 9
    end

    it "can rotate" do
      @array[0] = 'one'
      @array[1] = 'two'
      @array[2] = 'three'

      @rotated = @array.rotate

      expect(@rotated[0]).to eq 'two'
      expect(@rotated[1]).to eq 'three'
      expect(@rotated[2]).to eq 'one'
    end

    it "can rotate!" do
      @array[0] = 'one'
      @array[1] = 'two'
      @array[2] = 'three'

      @array.rotate!

      expect(@array[0]).to eq 'two'
      expect(@array[1]).to eq 'three'
      expect(@array[2]).to eq 'one'
    end

    it "can shovel" do
      @array[0]= 'a'
      @array << 'b'
      @array << 'c'

      expect(@array[0]).to eq 'a'
      expect(@array[1]).to eq 'b'
      expect(@array[2]).to eq 'c'
    end

    it "knows when it's empty" do
      expect(@array.empty?).to be_true

      @array[1] = 'a'

      expect(@array.empty?).to be_false
    end

    it "returns first" do
      expect(@array.first).to be_nil
      @array << 'a'
      expect(@array.first).to eq 'a'
    end

    it "returns last" do
      expect(@array.last).to be_nil
      @array << 'a'
      expect(@array.last).to eq 'a'
      @array << 'b'
      @array << 'c'
      expect(@array.last).to eq 'c'
    end

    it "iterates over each item" do

      str = ''
      @array.each{|i| str << i}

      str.should eq ''

      @array << 'a'
      @array << 'b'
      @array << 'c'

      str = ''
      @array.each{|i| str << i}

      str.should eq 'abc'
    end

    it "swaps" do
      @array << 'a'
      @array << 'b'

      swapped = @array.swap(0,1)
      
      expect(swapped[0]).to eq 'b'
      expect(swapped[1]).to eq 'a'

      swapped << 'c'
      swapped << 'd'

      swapped = swapped.swap(1, 3)
      
      expect(swapped[0]).to eq 'b'
      expect(swapped[1]).to eq 'd'
      expect(swapped[2]).to eq 'c'
      expect(swapped[3]).to eq 'a'
    end

    it "pops" do
      @array << 'a'
      @array << 'b'

      expect(@array[0] == 'a')

      @array.pop('a')
      expect(@array[0] == 'b')
    end

    it "can tell you if it includes something" do
      @array << 'd'

      expect(@array.include?('a')).to be_false

      @array << 'a'
      @array << 'b'
      @array << 'c'

      expect(@array.include?('a')).to be_true
    end

    it "can retrieve and remove the first item with shift" do
      @array << 'a'
      @array << 'b'

      expect(@array.include?('a')).to be_true

      @array.shift

      expect(@array.include?('a')).to be_false
    end

    it "can remove an item at a certain index" do
      @array << 'a'
      @array << 'b'

      expect(@array[0] == 'a')

      @array.delete_at(0)

      expect(@array[0] == 'b')
    end

    it "can remove nils from array" do
      @array << 'a'
      @array << nil
      @array << 'b'

      @array.compact

      expect(@array[0]).to eq 'a'
    end

    xit "removes duplicates with uniq method" do
      @array << "lizard"
      @array << "monkey"
      @array << "tiger"
      @array << "lizard"

      expect(@array.uniq).to eq(FunArray.new(['lizard','monkey','tiger']))
    end

    it "knows when it is equal to another 'fun' array" do
      @array2 = FunArray.new
      expect(@array == @array2).to be_true

      @array2 << 'a'
      expect(@array == @array2).to be_false

      @array << 'a'
      expect(@array == @array2).to be_true

      @array << 'b'
      expect(@array == @array2).to be_false

      @array2 << 'b'
      expect(@array == @array2).to be_true

    end

    it "can add one 'fun' array to another" do
      @array << 'monkey'

      appended_array = @array + 'a'
      expect(appended_array).to eq(FunArray.new(['monkey', 'a']))
    end

  end
