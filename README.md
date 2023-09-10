### Story Prompt

It is a command line application in Ruby language that accepts a JSON string of key-value inputs for the template above. With valid input, the application sends to STDOUT the story using the inputs provided.
With format

> One day Anna was walking her {{NUMBER}} {{UNIT_OF_MEASURE}} commute to {{PLACE}} and found a {{ADJECTIVE}} {{NOUN}} on the ground.

For example, "One day Anna was walking her 2-mile commute to school and found a blue rock on the ground."
It stores a record of valid inputs locally in a file.
It is also able to print statistics about the stored records, including the maximum and minimum values for numerical inputs, the most and least common responses for string inputs, and frequency of each responses/word.


**Require**
-   \> Ruby 2.7

**Run:**

     $ ruby main.rb

**Test:**

    $ bundle install
    $ bundle exec rspec
