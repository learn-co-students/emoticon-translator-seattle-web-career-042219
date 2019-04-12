# require modules here
require 'pry'
require 'yaml'

def load_library(file_path)
  # code goes here
  library = YAML.load_file(file_path)
  new_hash = Hash["get_meaning" => {}, "get_emoticon" => {}]
  library.each do |name, array|
    new_hash["get_meaning"][array[1]] = name
    new_hash["get_emoticon"][array[0]] = array[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  lib = load_library(file_path)
  lib["get_emoticon"].each do |key, value|
    if key == emoticon
      return value
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  lib = load_library(file_path)
  lib["get_meaning"].each do |key, value|
    if key == emoticon
      return value
    end
  end
  "Sorry, that emoticon was not found"
end