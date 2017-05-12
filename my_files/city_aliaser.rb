#!/usr/bin/env ruby
require 'rubygems'
require 'mechanize'
require 'json'

url = 'https://en.wikipedia.org/wiki/List_of_city_nicknames_in_the_United_States'
STATES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado',
          'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho',
          'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
          'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
          'Mississippi', 'Missouri', 'Montana Nebraska', 'Nevada',
          'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
          'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon',
          'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota',
          'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington',
          'West Virginia', 'Wisconsin', 'Wyoming', 'District of Columbia',
          'Puerto Rico'].freeze
agent = Mechanize.new
page = agent.get(url)
state_h2s = page.search('h2').select { |h2| STATES.include?(h2.content) }
aliases = {}

def clean_city_alias(name)
  index = name.index('[')
  name = name[0...index] if index
  name = name[0...(name.length - 1)] if name.end_with?('.')
  index = name.index('(')
  name = name[0...index] if index
  name = name.strip
  return name.split(' or ') if name.include?(' or ')
  [name]
end

def state_h2?(node)
  STATES.include?(node.content)
end

def get_state(city_li)
  state_ul = city_li.parent
  state_h2 = state_ul.previous_sibling
  state_h2 = state_h2.previous_sibling while state_h2 && !state_h2?(state_h2)
  return state_h2.content if state_h2
end

state_h2s.each do |state_h2|
  state = state_h2.content
  aliases[state] = {}
end
city_lis = page.search('h2 ~ ul > li')
city_lis.each do |city_li|
  state = get_state(city_li)
  next unless state
  alias_ul = city_li.search('ul')
  unless city_li.content.include?(' - ') || !alias_ul.empty? ||
         state == 'District of Columbia'
    next
  end
  city_link = city_li.search('> a:first-child').first
  city = if city_link
           city_link.content
         else
           city_li.content
         end
  if city.start_with?('Contemporary nicknames of Atlanta',
                      'Historical nicknames for the city include')
    city = 'Atlanta'
  end
  city = 'District of Columbia' if state == 'District of Columbia'
  puts "#{city}, #{state}..."
  aliases[state][city] ||= []
  if !alias_ul.empty?
    alias_ul.search('li').each do |alias_li|
      city_aliases = clean_city_alias(alias_li.content)
      aliases[state][city] = aliases[state][city].concat(city_aliases)
    end
  else
    city_aliases = clean_city_alias(city_li.content.split(' - ').last)
    aliases[state][city] = aliases[state][city].concat(city_aliases)
  end
end
path = 'us_city_aliases.json'
File.open(path, 'w') { |file| file.puts JSON.pretty_generate(aliases) }
puts "Wrote #{path}!"
