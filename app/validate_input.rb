module ValidateInput
  def validate_input(number, unit_of_measure, place, adjective, noun)
    number.positive? &&
    validate_string(unit_of_measure) &&
    validate_string(place) &&
    validate_string(adjective) &&
    validate_string(noun)
  end

  def validate_string(phrase)
    return false if !(phrase.length < 20 && !phrase.length.zero?)
    phrase !~ /\d/
  end
end
