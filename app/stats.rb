require 'colorize'

module Stats
  NUMBER = 'Number'
  MEASURING_UNIT = 'Unit Of Measuring'
  PLACE = 'PLACE'
  ADJECTIVE = 'Adjective'
  NOUN = 'Noun'

  def print_stats(prompts_array)
    number_array = Array.new
    unit_of_measure_array = Array.new
    place_array = Array.new
    adjective_array = Array.new
    noun_array = Array.new
    prompt_count = prompts_array.length

    prompts_array.each do |prompt|
      number_array << prompt[1].to_i
      unit_of_measure_array << prompt[2]
      place_array << prompt[4]
      adjective_array << prompt[6]
      noun_array << prompt[8]
    end

    number_array = sort_array(number_array)
    unit_of_measure_array = sort_array(unit_of_measure_array)
    place_array = sort_array(place_array)
    adjective_array = sort_array(adjective_array)
    noun_array = sort_array(noun_array)

    puts "Printing Details In Graph\n".green

    print_graph(number_array, NUMBER)
    print_graph(unit_of_measure_array, MEASURING_UNIT)
    print_graph(place_array, PLACE)
    print_graph(adjective_array, ADJECTIVE)
    print_graph(noun_array, NOUN)

    puts "Printing Frequency Details\n".green

    print_min_max_frequency(number_array)
    print_min_max_frequency(unit_of_measure_array)
    print_min_max_frequency(place_array)
    print_min_max_frequency(adjective_array)
    print_min_max_frequency(noun_array)
  end

  def sort_array(items)
    items.sort { |x,y| y<=>x }
  end

  def print_graph(items, message)
    puts "Details of #{message}".yellow
    temp = ''
    items.each do |item|
      unless item == temp
        temp = item
        print "Value: #{item}, Frequency: #{items.count(item)} |".red
        print_blue(items.count(item))
      end
    end
    puts "\n"
  end

  def print_blue(frequency)
    frequency.times do
      print '+'.blue
    end
    puts "\n"
  end

  def find_min_max_frequency(items)
    max_counter = items.count(items.first)
    max_value = items.first
    min_counter = items.count(items.first)
    min_value = items.first
    items.each do |item|
      if items.count(item) > max_counter
        max_counter = items.count(item)
        max_value = item
      end
      if items.count(item) < min_counter
        min_counter = items.count(item)
        min_value = item
      end
    end
    [min_value, min_counter, max_value, max_counter]
  end

  def print_min_max_frequency(items)
    frequency = find_min_max_frequency(items)

    puts "Min Frequency".light_blue
    puts "Value: #{frequency[0]}, Frequency: #{frequency[1]}".red

    puts "Max Frequency".yellow
    puts "Value: #{frequency[2]}, Frequency: #{frequency[3]}\n".red
  end
end
