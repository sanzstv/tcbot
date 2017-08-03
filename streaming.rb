#!/usr/bin/env ruby
require 'Twitter'
require_relative 'queries'

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

		rest_client = Twitter::REST::Client.new(config)
		streaming_client = Twitter::Streaming::Client.new(config)

		#TEST MSG
		#client.update("This is a bot that reports on true crime!")


		search_params = {
			result_type: "mixed",
			count: 3
		}

	
		 streaming_client.filter(:track => TCBotSearch.keyphrases.join (',')) do |tweet|
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

