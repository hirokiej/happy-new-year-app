# frozen_string_literal: true

class NewYearCelebrator
  def initialize(year, font)
    @year = year
    @art_generator = font ? TextArtGnerator.new(font: font) : TextArtGnerator.new
    @text_animatior = TextArtAnimator.new
  end

  def run
    warn_and_exit_invalid_year_message if @year <= 0
    print "\e[?25l"
    begin
      play_all_animations
    rescue Interrupt
      exit
    ensure
      print "\e[?25h"
    end
  end

  private

  def last_year
    @year - 1
  end

  def last_year_art
    @art_generator.generate_text_art(last_year)
  end

  def new_year_art
    @art_generator.generate_text_art(@year)
  end

  def fresh_start
    @art_generator.generate_text_art('Fresh Start!')
  end

  def happy_new_year
    @art_generator.generate_text_art('Happy New Year!')
  end

  def empty_lines
    Array.new(@text_animatior.height) { ' ' * @text_animatior.width }
  end

  def play_all_animations
    animate_last_year
    fade_in_new_year
    display_colored_happy_new_year_randomly
  end

  def warn_and_exit_invalid_year_message
    puts 'Please provide the new year as a parameter after file name, like "./happy_new_year.rb 2025".'
    exit(1)
  end

  def animate_last_year
    @text_animatior.slide_to_left(last_year_art, 0.02)
    system('clear')
    puts last_year_art
    sleep(0.5)
    system('clear')
    puts @art_generator.generate_year_art(last_year)
  end

  def fade_in_new_year
    @text_animatior.fade_from_top(new_year_art, last_year_art, 0.4)
    system('clear')
    sleep(0.2)
    @text_animatior.fade_from_top(fresh_start, empty_lines, 0.1)
    sleep(1)
    system('clear')
    sleep(1)
  end

  def display_colored_happy_new_year_randomly
    text_coloring = ColoredTextLooper.new(happy_new_year)
    text_coloring.loop_random_colored_happy_new_year
  end
end
