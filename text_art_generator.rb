# frozen_string_literal: true

require 'artii'
require 'optparse'

class TextArtGnerator
  def initialize(font: 'slant')
    @artii = Artii::Base.new(font: font)
  end

  def generate_text_art(message)
    @artii.asciify(message).split("\n")
  end

  def generate_year_art(year)
    @artii.asciify(year).split("\n")
  end
end
