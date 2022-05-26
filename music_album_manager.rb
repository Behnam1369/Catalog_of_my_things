require_relative 'music_album'

module MusicAlbumManager
  def music_album_list
    if @music_albums.length.zero?
      puts 'There is no music album in the collection yet.'
    else
      puts 'List of all music albums:'
    end
    puts(@music_albums.each_with_index.map do |el, index|
      "Album No.#{index + 1} - Publish Date: #{el.publish_date} " \
        "Available On Spotify: #{el.on_spotify ? 'Yes' : 'No'} " \
        "Archived: #{el.archived ? 'Yes' : 'No'} "
    end)
  end

  def add_music_album
    last_id = @music_albums.map(&:id).max
    id = (last_id || 0) + 1
    print 'Please enter publish date: '
    publish_date = gets.chomp
    on_spotify = _on_spotify
    music_album = MusicAlbum.new(id, publish_date, on_spotify)
    @music_albums << music_album
    MusicAlbumJSON.new.save_data(@music_albums)
    puts 'Music album was added to the collection successfully.'
  end

  def _on_spotify
    print 'Is this music album available on Spotify? (Y/N): '
    answer = gets.chomp
    if %w[Y y].include?(answer)
      true
    elsif %w[N n].include?(answer)
      false
    else
      puts 'Invalid input, please try again.'
      _on_spotify
    end
  end
end
