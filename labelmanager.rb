module LabelManager
  def set_default_labels
    ['Artist Alliance Recording', 'Independent Star Records', 'Beatnik Records']
  end

  def list_labels
    puts 'Labels List:'
    set_default_labels.each_with_index { |label, i| puts "#{i} - #{label}"}
    puts ''
  end
end