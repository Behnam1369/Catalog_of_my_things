require './label'
require './item'

describe Label do
  before :all do
    @label = Label.new(5, 'Label Records', 'Red')
    @item = Item.new(1, '2020/05/03')
  end

  it 'should be an instance of Label class' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'should have items attribute as an empty array by default' do
    expect(@label.items.empty?).to be(true)
  end

  it 'should access title' do
    expect(@label.title).to eq('Label Records')
  end

  it 'should access color' do
    expect(@label.color).to eq('Red')
  end

  context '#add_item' do
    it 'should add an item to items list' do
      @label.add_item(@item)
      expect(@label.items.include?(@item)).to be(true)
    end

    it 'should add label to an item when' do
      expect(@item.label.title).to eq('Label Records')
    end
  end
end
