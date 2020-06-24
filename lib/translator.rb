# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  # code goes here
  new_library = {}
  meaning_hash = {}
  emoticon_hash = {}
  library = YAML.load_file(path)

  library.invert.each do |symbol_array, meaning|
      emoticon_hash[symbol_array[0]] = symbol_array[1]
      meaning_hash[symbol_array[1]] = meaning
  end

  new_library["get_meaning"] = meaning_hash
  new_library["get_emoticon"] = emoticon_hash
  new_library
  #binding.pry
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library["get_emoticon"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
  library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  if library["get_meaning"][emoticon] == nil
    "Sorry, that emoticon was not found"
  else
  library["get_meaning"][emoticon]
  end
  # code goes here
end
