#!/usr/bin/env ruby
require 'Twitter'

#this bot (still in progress) is meant to monitor crime/mystery 
#related topics on the Twitter
while true
	begin
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['TWITTER_CKEY']
		  config.consumer_secret     = ENV['TWITTER_CSECRET']
		  config.access_token        = ENV['TWITTER_ACCESSTOKEN']
		  config.access_token_secret = ENV['TWITTER_AT_SECRET']
		end

		rest_client = Twitter::REST::Client.new config
		streaming_client = Twitter::Streaming::Client.new(config)

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
			'corpse',
			'corpses',
			'missing',
			'murder',
			'murders',
			'killing',
			'killings',
			'slaying',
			'cold case'
		]

		streaming_client.filter(:track => keyphrases.join (',')) do |tweet|
			#articles are best but tweets will be ok to test
			if tweet.is_a?(Twitter::Tweet) && !retweeted
				puts tweet.text
				rest_client.retweet tweer
			end
		end
		rescue
		 	puts 'error'
		 	sleep 5
		end

	end
end

