#!/usr/bin/env ruby
require 'Twitter'

#this bot (still in progress) is meant to monitor crime/mystery 
#related topics on the Twitter
while true
	begin
		config ={
		  consumer_key: ENV['TWITTER_CKEY'],
		  consumer_secret: ENV['TWITTER_CSECRET'],
		  access_token: ENV['TWITTER_ACCESSTOKEN'],
		  access_token_secret: ENV['TWITTER_AT_SECRET']
		}

		client = Twitter::REST::Client.new(config)
		#streaming_client = Twitter::Streaming::Client.new(config)
		#client.update("This is a bot that reports on true crime!")

		#list of keyphrases to check for, obviously need to find way to streamline
		keyphrases = [	
			'disappearance',
			'disappearances',
			'unsolved',
			'unresolved',
			'unidentified',
			'Jane Doe',
			'John Doe',
			'#amberalert',
			'Amber Alert',
			'mystery',
			'mysteries',
			'manhunt',
			'suspect',
			'bodies',
			'remains',
			'missing',
			'murder',
			'murders',
			'killing',
			'killings',
			'slaying',
			'cold case'
		]


		search_params = {
			result_type: "mixed",
			count: 3
		}

		keyphrases.each do |query|
			client.search(query, search_params).each do |tweet|
				#don't want to retweet multiple times
				if tweet.retweeted? == false
					client.retweet tweet
				end
			end
			puts query
		end
		break
		# streaming_client.filter(:track => keyphrases.join (',')) do |tweet|
		# 	#articles are best but tweets will be ok to test
		# 	if tweet.is_a?(Twitter::Tweet) && !retweeted
		# 		puts tweet.text
		# 		rest_client.retweet tweer
		# 	end
		# end
		# rescue
		#  	puts 'error'
		#  	sleep 5
		# end

	end
end

