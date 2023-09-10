# frozen_string_literal: true

require "spec_helper"
require './app/validate_input'
require './app/file_handling'
require './app/stats'

describe 'APP' do
  include Rack::Test::Methods
  include ValidateInput
  include FileHandling
  include Stats

  context "validate input" do
    it "should return true when input is valid" do
      expect(validate_input(4, 'mile', 'school', 'red', 'stone')).to eq(true)
    end

    it "should return false when input is invalid" do
      expect(validate_input(4, '5', 'school', 'red', 'stone')).to eq(false)
    end
  end

  context "file handling" do
    it "should read and write data from file" do
      prompt = 'One day Anna was walking her 2 mile commute to school and found a blue rock on the ground.'
      write_file(prompt, 'testing_file.txt')

      prompt_list = read_file('testing_file.txt')
      expect(prompt_list.first.first).to eq("#{prompt}\n")

      FileUtils.rm_rf(Dir["testing_file.txt"])
    end
  end

  context "print state" do
    before do
      prompt = 'One day Anna was walking her 2 mile commute to school and found a blue rock on the ground.'
      write_file(prompt, 'testing_file.txt')
    end

    after do
      FileUtils.rm_rf(Dir["testing_file.txt"])
    end

    it "should print frequency of data available in file" do
      prompt_list = read_file('testing_file.txt')
      print_stats(prompt_list)
      allow(STDOUT).to receive_message_chain(:puts).and_return(anything)
    end
  end
end
