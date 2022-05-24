require './author'
require './item'

describe Author do
  before(:each) do
    @author = Author.new(12, 'John', 'Doe')
    @item = Item.new(12, '2022/2/3')
    @author.add_item(@item)
  end

  it 'should have a specific id' do
    expect(@author.id).not_to eq(15)
  end

  it 'Should store items' do
    expect(@author.items.length).to eq(1)
  end

  it 'Should have relationship with items' do
    expect(@item.author).to eq(@author)
  end
end
