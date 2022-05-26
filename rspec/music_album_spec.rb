require './music_album'
describe 'Music Album' do
  before :each do
    @music_album = MusicAlbum.new(1, '2022/01/01', true)
  end

  it 'Should be an instance of music_album class' do
    expect(@music_album).to be_an_instance_of(MusicAlbum)
  end

  it 'Should be inherited from Item class' do
    expect(@music_album).to be_a_kind_of(Item)
  end

  it 'can_be_archived? method should not be accessible' do
    @music_album.on_spotify = false
    expect { @music_album.can_be_archived? }.to raise_error(NoMethodError)
  end

  it 'Should have a default false value for the archived property' do
    archived = @music_album.archived
    expect(archived).to be(false)
  end

  it 'Should be archived using move_to_archive method' do
    @music_album.on_spotify = true
    @music_album.publish_date = Date.new(2010, 11, 21)
    @music_album.move_to_archive
    archived = @music_album.archived
    expect(archived).to be(true)
  end

  it 'Should not be archived using move_to_archive method if it is on spotify' do
    @music_album.on_spotify = false
    @music_album.publish_date = Date.new(2010, 11, 21)
    @music_album.move_to_archive
    archived = @music_album.archived
    expect(archived).to be(false)
  end
end
