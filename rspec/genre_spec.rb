require './genre'
require './item'
describe 'Genre' do
  genre = Genre.new(1, 'Pop')

  it 'Should be an instance of Genre class' do
    expect(genre).to be_an_instance_of(Genre)
  end

  it 'Should have an empty items list' do
    count = genre.items.length
    expect(count).to eq(0)
  end

  it 'Should have one Item after adding the item using add_item method' do
    item = Item.new(1, '2020/11/10')
    genre.add_item(item)
    count = genre.items.length
    expect(count).to eq(1)
  end
end
