require 'date'
require './book'
require './item'

describe Book do
  before :all do
    @book = Book.new(3, '2022/05/01', 'New Records', 'bad')
  end

  it 'should be an instance of Book' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'should be be inherited from Item class' do
    expect(@book).to be_a_kind_of(Item)
  end

  it 'should access publisher attribute' do
    expect(@book.publisher).to eq('New Records')
  end

  it 'should access cover_state attribute' do
    expect(@book.cover_state).to eq('bad')
  end

  context '#can_be_archived?' do
    it 'should be private' do
      expect { @book.can_be_archived? }.to raise_error(NoMethodError)
    end
  end

  context '#move_to_archive' do
    it 'should be true when the cover_state is bad' do
      @book.move_to_archive
      expect(@book.archived).to be(true)
    end

    it 'should be true when the cover_state is not bad and publish_date is higher than 10 years' do
      @book.publish_date = Date.parse('2010/01/01')
      @book.move_to_archive
      expect(@book.archived).to be(true)
    end
  end
end
