#cache.rb

require 'json'

def CacheTweet(cache)
	File.open("config.json", "w") do |file|
		cached = {
			ids => cache
		}
		file.write(cached.to_json)
		puts "Most recent Tweets cached"
	end
end

def ReadCache()
	file = File.read('config.json')

	response = JSON.parse(file)
	#id_cache = response["since_id"]

	return id
end