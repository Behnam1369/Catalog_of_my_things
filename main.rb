def options
  puts 'if you want to exit the app press E'
  exit = gets.chomp
  case exit
  when 'E'
    puts 'thanks for using the app see you later'
  else
    puts 'Wrong choice'
    options
  end
end

def main
  puts 'Welcome to the cataloge of my things'
  options
end

main
