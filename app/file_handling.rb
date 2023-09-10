module FileHandling
  def write_file(prompt, file_name = 'prompt_output.txt')
    begin
      File.open(file_name, 'a+') { |file| file.puts(prompt) }
    rescue => exception
      puts exception
    end
  end

  def read_file(file_name = 'prompt_output.txt')
    prompts_array = Array.new
    begin
      File.readlines(file_name).each do |line|
        prompts_array << line.split(';')
      end
    rescue => exception
      puts exception
    end
    prompts_array
  end
end
