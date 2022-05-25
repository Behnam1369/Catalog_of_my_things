require 'json'

class JsonManager
  def initialize(path)
    @path = path
    check_file
  end

  def check_file
    File.write(@path, '[]') unless File.exist?(@path)
  end

  def load_data
    read_path = File.read(@path)
    JSON.parse(read_path)
  end

  def save_data(obj)
    File.write(@path, obj)
  end
end
