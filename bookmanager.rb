require 'date'
require_relative 'book'

module BookManager
  def add_book(next_book_index)
    publish_date = ''
    loop do
      print 'Please enter publish date: '
      publish_date = gets.chomp
      break if date_checker(publish_date)
    end

    print "Please enter the book's publisher: "
    publisher = gets.chomp

    cover_state_selected = nil

    loop do
      puts "Select the book's cover state: "
      puts '1- good'
      puts '2- bad'
      cover_state_selected = gets.chomp.to_i
      break if cover_state_checker(cover_state_selected)
    end

    cover_state = cover_state_selected == 1 ? 'good' : 'bad'

    puts 'Book added'
    Book.new(next_book_index, publish_date, publisher, cover_state)
  end

  def list_books(books)
    if books.empty?
      puts 'Booklist is empty'
      return
    end

    books.each do |book|
      print 'Book: '
      puts "publish date: #{book.publish_date} - publisher: #{book.publisher} - cover state: #{book.cover_state} \n"
    end
  end

  def date_checker(publish_date)
    begin
      Date.parse(publish_date)
    rescue Date::Error
      puts 'Invalid date, it should be follow the format: yyyy/mm/dd'
      return false
    end
    true
  end

  private

  def cover_state_checker(cover_state_selected)
    unless [1, 2].include?(cover_state_selected)
      puts 'Invalid option'
      return false
    end
    true
  end
end
