require_relative 'label'
require 'json'

module LabelManager
  def set_default_labels
    path = './data/label.json'
    data = []
    json = File.read(path)
    data = JSON.parse(json) if File.exist?(path)
    data.map { |label| Label.new(2, label['title'], label['color']) }
  end

  def list_labels
    puts 'Labels List:'
    set_default_labels.each_with_index { |label, i| puts "#{i + 1} - #{label.title} - color: #{label.color}" }
    puts ''
  end
end
