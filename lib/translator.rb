require "yaml"
require "pry"

def load_library(file_to_load)
  library = {"get_meaning"=>{}, "get_emoticon"=>{}}
  emoticon_library = YAML.load_file(file_to_load)
  emoticon_library.each do |meaning, emoticon_array|
    english, japanese = emoticon_array
    library["get_meaning"][japanese] = meaning
    library["get_emoticon"][english] = japanese
  end
  library
end

def get_japanese_emoticon(file_to_load, emoticon)
  emoticon_library=load_library(file_to_load)
  result = emoticon_library["get_emoticon"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_to_load, emoticon)
  emoticon_library=load_library(file_to_load)
  result = emoticon_library["get_meaning"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end