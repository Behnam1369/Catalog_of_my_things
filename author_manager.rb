require './author'

module AuthorManager
  def set_default_authors
    default_authors = [
      {
        id: '1',
        first_name: 'William',
        last_name: 'Shakespeare'
      },
      {
        id: '2',
        first_name: 'Agatha',
        last_name: 'Christie'
      },
      {
        id: '3',
        first_name: 'Barbra',
        last_name: 'Cartland'
      },
    ]

    default_authors.each.map { |author| Author.new(author[:id], author[:first_name], author[:last_name]) }
  end

  def list_all_authors
    puts 'Labels List:'
    set_default_authors.each { |author| puts " ID: #{author.id} - Name: #{author.first_name + ' ' + author.last_name}" }
    puts ''
  end
end
