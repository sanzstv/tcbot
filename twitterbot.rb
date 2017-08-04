#!/usr/bin/env ruby
require 'Twitter'
require_relative 'queries'

#this bot (still in progress) is meant to monitor crime/mystery related topics on The Twitter
	config = {
		  consumer_key: ENV['TWITTER_CKEY'],
		  consumer_secret: ENV['TWITTER_CSECRET'],
		  access_token: ENV['TWITTER_ACCESSTOKEN'],
		  access_token_secret: ENV['TWITTER_AT_SECRET']
	}
	client = Twitter::REST::Client.new(config)

	#TEST MSG
	#client.update("This is a bot that reports on true crime!")
	search_params = {
		result_type: "mixed",
		count: 3,
		lang: "en"
	}
	TCBotSearch.keyphrases.each do |query|
		client.search(query, search_params).each do |tweet|
			#don't want to retweet multiple times
			if tweet.retweeted? == false
				client.retweet tweet
			end
		end
	end


