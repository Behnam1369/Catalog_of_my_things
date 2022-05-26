require_relative 'label'
require 'json'

module LabelManager
  def set_default_labels
    default_labels = [
      {
        id: 1,
        title: "Artist Alliance Recording",
        color:"Red"
      },
      {
        id: 2,
        title: "Independent Star Records",
        color: "Blue"
      }
    ]

    default_labels.map { |label| Label.new(2, label[:title], label[:color]) }
  end

  def list_labels
    puts 'Labels List:'
    set_default_labels.each_with_index { |label, i| puts "#{i + 1} - #{label.title} - color: #{label.color}" }
    puts ''
  end
end
