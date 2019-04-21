# require modules here
require "pry"
require "yaml"

def load_library(emoticons)
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons_data = YAML.load_file(emoticons) # { "O:)" => "☜(⌒▽⌒)☞" }

  emoticons_data.each do |meaning, emoticons|

      new_hash["get_meaning"][emoticons[1]]= meaning
      new_hash["get_emoticon"][emoticons[0]] = emoticons[1]

    end
  new_hash
end

def get_japanese_emoticon(emoticons, emoticon)

  library = load_library(emoticons)

    if library["get_emoticon"][emoticon] == nil
      "Sorry, that emoticon was not found"
    else
      library["get_emoticon"][emoticon]
    end
end

def get_english_meaning(emoticons, emoticon)

  library = load_library(emoticons)

    if library["get_meaning"][emoticon] == nil
      "Sorry, that emoticon was not found"
    else
      library["get_meaning"][emoticon]
    end
end
