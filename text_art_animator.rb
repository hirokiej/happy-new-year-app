# frozen_string_literal: true

require_relative 'text_art_generator'

class TextArtAnimator
  attr_reader :height, :width

  def initialize
    @art_generator = TextArtGnerator.new
    @max_lines = @art_generator.generate_text_art('Happy New Year!')
    @height = @max_lines.size
    @width = @max_lines[0].size
    @empty_lines = Array.new(@height, ' ' * @width)
  end

  def slide_to_left(lines, speed)
    @width.times do |step|
      @height.times do |row|
        @empty_lines[row] = ' ' * (@width - step - 1) + lines[row][0..step]
      end
      system('clear')
      @empty_lines.each { |row| puts row }
      sleep(speed)
    end
  end

  def fade_from_top(original_lines, new_lines, speed)
    @height.times do |line|
      new_lines[line] = original_lines[line]
      system('clear')
      new_lines.each do |new_line|
        puts new_line
      end
      sleep(speed)
    end
  end
end
