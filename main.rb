require './app/validate_input'
require './app/file_handling'
require './app/stats'

class Main
  include ValidateInput
  include FileHandling
  include Stats

  def verify_input_and_print_prompt(number, unit_of_measure, place, adjective, noun)
    is_string_valid = validate_input(number, unit_of_measure, place, adjective, noun)
    print_string(number, unit_of_measure, place, adjective, noun) if is_string_valid
  end

  def print_string(number, unit_of_measure, place, adjective, noun)
    prompt = "One day Anna was walking her ;#{number} ;#{unit_of_measure}; commute to ;#{place}; and found a ;#{adjective}; ;#{noun}; on the ground."
    puts "#{prompt.gsub(';', '')}".blue
    write_file(prompt, 'prompt_output.txt')
  end

  def statistics
    prompt_list = read_file('prompt_output.txt')
    print_stats(prompt_list) unless prompt_list.length.zero?
    puts 'File does not contain anything'.red if prompt_list.length.zero?
  end
end

# Main
puts 'WELCOME TO COMMONPAPER STORY PROMPT GENERATOR
  -> Please Enter 1 For Creating A Story Prompt
  -> Please Enter 2 For Stats
  -> Please Enter Any Value to Quit'.red

print 'Enter your choice: '.blue
choice = gets.chomp.to_i
case choice
when 1
  print 'Enter Number: '.light_blue
  number = gets.chomp.to_i

  print 'Enter Unit Of Measure: '.light_blue
  unit_of_measure = gets.chomp.downcase

  print 'Enter Place: '.light_blue
  place = gets.chomp.downcase

  print 'Enter Adjective: '.light_blue
  adjective = gets.chomp.downcase

  print 'Enter Noun: '.light_blue
  noun = gets.chomp.downcase

  Main.new.verify_input_and_print_prompt(number, unit_of_measure, place, adjective, noun)
when 2
  Main.new.statistics
else
  puts 'Invalid Input'.red
end