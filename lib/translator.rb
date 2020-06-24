require "yaml"


def load_library(filepath)
  emoti_lib = {
    'get_meaning' => {},
    'get_emoticon' => {}
}
  emotis = YAML.load_file(filepath)
  print emotis
    emotis.each do |meaning, emoti_array|
      emoti_lib['get_meaning'][emoti_array.last] = meaning
    end
    emotis.each do |meaning, emoti_array|
      emoti_lib['get_emoticon'][emoti_array.first] = emoti_array.last
    end
  return emoti_lib
end

def get_japanese_emoticon(filepath, eng_emoti)
  emoti_lib = load_library(filepath)
  if emoti_lib['get_emoticon'][eng_emoti] == nil
    return "Sorry, that emoticon was not found"
  else
    return emoti_lib['get_emoticon'][eng_emoti]
  end
end

def get_english_meaning(filepath, jp_emoti)
  emoti_lib = load_library(filepath)
  if emoti_lib['get_meaning'][jp_emoti] == nil
    return "Sorry, that emoticon was not found"
  else
    return emoti_lib['get_meaning'][jp_emoti]
  end
end
