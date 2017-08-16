#cache.rb

require 'json'

def CacheTweet(id, text)
	tweet ={
		"since_id" => id,
		"tweet_text" => text
	}
	File.open("config.json", "w") do |file|
		file.write(tweet.to_json)
		puts "Most recent Tweet cached"
	end
end

def ReadCache()
	file = File.read('config.json')

	response = JSON.parse(file)
	id = response["since_id"]
	text = response["text"]

	return id
end