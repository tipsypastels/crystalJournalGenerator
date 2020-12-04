require 'dotenv/load'
require 'net/http'
require 'byebug'
require 'nokogiri'
require 'active_support/all'

require_relative 'lib/about'
require_relative 'lib/party'
require_relative 'lib/pokemon'
require_relative 'lib/sections'
require_relative 'lib/section'
require_relative 'lib/imgur'

module Main
  Dir.mkdir('output') unless File.exist?('output')

  EP_ID = ARGV.first

  IN_FILE  = "entries/#{EP_ID}.xml"
  OUT_FILE = "output/#{EP_ID}.bbcode"

  # law of demeter? i don't know her
  XML = Nokogiri::Slop(File.read(IN_FILE))

  IMAGES   = {}
  TITLE    = XML.episode.title.content
  ABOUT    = About.new(XML.episode)
  PARTY    = Party.new(XML.episode)
  SECTIONS = Sections.new(XML.episode)

  LAYOUT = File.read('layouts/layout.bbcode')
  OUTPUT = format LAYOUT,
    title: TITLE, 
    episode: EP_ID, 
    about: ABOUT, 
    sections: SECTIONS,
    party: PARTY

  File.write(OUT_FILE, OUTPUT)

  puts "✔️  Done! Wrote to #{OUT_FILE}."
end