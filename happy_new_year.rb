#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'rainbow'
require_relative 'colored_text_looper'
require_relative 'new_year_celebrator'
require_relative 'text_art_animator'
require_relative 'text_art_generator'

year = ARGV[0].to_i
font = ARGV[1]
app = NewYearCelebrator.new(year, font)
app.run
