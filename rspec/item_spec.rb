require './item'
describe 'Item' do
  item = Item.new(1, '2010/01/01')

  it 'Should be an instance of Item class' do
    expect(item).to be_an_instance_of(Item)
  end

  it 'Default value for archived attribute should be "false" ' do
    archived = item.archived
    expect(archived).to be(false)
  end

  it 'can_be_archived? method should not be accessible' do
    expect { item.can_be_archived? }.to raise_error(NoMethodError)
  end

  it 'Should be archived using move_to_archive method (if it can be archived)' do
    item.move_to_archive
    archived = item.archived
    expect(archived).to be(true)
  end

  it 'Should not be archived using move_to_archive method (if it can\'t be archived)' do
    item = Item.new(1, '2020/11/11')
    item.move_to_archive
    archived = item.archived
    expect(archived).to be(false)
  end
end
