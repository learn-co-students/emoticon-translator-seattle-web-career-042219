# require modules here
require "yaml"

def load_library(emoticons)
  # code goes here
  emoticons_data = YAML.load_file(emoticons) #{"angel"=>["O:)", "☜(⌒▽⌒)☞"], "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
  emote_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons_data.each do |key, value|
    emote_hash["get_meaning"][value[1]] = key
    emote_hash["get_emoticon"][value[0]] = value[1]
  end
  emote_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emote_hash = load_library(file_path)
  if emote_hash["get_emoticon"].key?(emoticon)
    emote_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emote_hash = load_library(file_path)
  if emote_hash["get_meaning"].key?(emoticon)
    emote_hash["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end