require_relative 'label'

module LabelManager
  def set_default_labels
    default_labels = [
      {
        title: 'Artist Alliance Recording',
        color: 'Red'
      },
      {
        title: 'Independent Star Records',
        color: 'Blue'
      },
      {
        title: 'Beatnik Records',
        color: 'Green'
      }
    ]

    default_labels.each_with_index.map { |label, index| Label.new(index, label[:title], label[:color]) }
  end

  def list_labels
    puts 'Labels List:'
    set_default_labels.each_with_index { |label, i| puts "#{i + 1} - #{label.title} - color: #{label.color}" }
    puts ''
  end
end
