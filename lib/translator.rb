def load_library(library)
  require "yaml"
  emoticons = YAML.load_file(library)
  get_meaning = {}
  get_emoticon = {}
  emoticons.each do |meaning, emoticon|
    get_meaning[emoticon[1]] = meaning
    get_emoticon[emoticon[0]] = emoticon[1]
  end
  emoticon = {
    "get_meaning" => get_meaning,
    "get_emoticon" => get_emoticon
  }
  return emoticon
end

def get_japanese_emoticon(file, face)
  emoticon_hash = load_library(file)
  if !emoticon_hash["get_emoticon"].has_key?(face)
    sorry_message = "Sorry, that emoticon was not found"
    return sorry_message
  end
  return emoticon_hash["get_emoticon"][face]
end

def get_english_meaning(file, face)
  emoticon_hash = load_library(file)
  if !emoticon_hash["get_meaning"].has_key?(face)
    sorry_message = "Sorry, that emoticon was not found"
    return sorry_message
  end
  return emoticon_hash["get_meaning"][face]
end