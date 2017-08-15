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