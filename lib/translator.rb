=begin

{"angel"=>["O:)", "☜(⌒▽⌒)☞"], 
"angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"], 
"bored"=>[":O", "(ΘεΘ;)"], 
"confused"=>["%)", "(゜.゜)"], 
"embarrased"=>[":$", "(#^.^#)"], 
"fish"=>["><>", ">゜))))彡"], 
"glasses"=>["8D", "(^0_0^)"], 
"grinning"=>["=D", "(￣ー￣)"], 
"happy"=>[":)", "(＾ｖ＾)"], 
"kiss"=>[":*", "(*^3^)/~☆"], 
"sad"=>[":'(", "(Ｔ▽Ｔ)"], 
"surprised"=>[":o", "o_O"], 
"wink"=>[";)", "(^_-)"]}
	
=end

# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file(file_path).each do |meaning, emotes|
	eng = emotes[0]
	jap = emotes[1]
	
	result["get_emoticon"][eng] = jap
	result["get_meaning"][jap] = meaning
  end	
  result
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  result = library["get_emoticon"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  result ? result : "Sorry, that emoticon was not found"
end