# frozen_string_literal: true

class ColoredTextLooper
  def initialize(happy_new_year)
    @happy_new_year = happy_new_year
  end

  def loop_random_colored_happy_new_year
    loop do
      system('clear')
      display_colored_happy_new_year
      sleep(0.1)
    end
  end

  private

  def display_colored_happy_new_year
    @happy_new_year.each do |line|
      colored_chars = colorize_chars_randomly(line)
      colored_line = colored_chars.join
      puts colored_line
    end
  end

  def colorize_chars_randomly(line)
    line.chars.map do |char|
      Rainbow(char).color(%i[red green blue yellow magenta cyan].sample).bright
    end
  end
end
