#!/usr/bin/env ruby
require 'Twitter'
require_relative 'queries'
require_relative 'cache'

#this bot (still in progress) is meant to monitor crime/mystery related topics on The Twitter
	config = {
		  consumer_key: ENV['TWITTER_CKEY'],
		  consumer_secret: ENV['TWITTER_CSECRET'],
		  access_token: ENV['TWITTER_ACCESSTOKEN'],
		  access_token_secret: ENV['TWITTER_AT_SECRET']
	}
	client = Twitter::REST::Client.new(config)
	file = File.read('config.json')

	response = JSON.parse(file)
	id = response["since_id"]
	text = response["text"]

	#TEST MSG
	search_params = {
		result_type: "mixed",
		count: 3,
		lang: "en",
		since_id: id
	}
	TCBotSearch.keyphrases.each do |query|
		client.search(query, search_params).each do |tweet|
			#don't want to retweet multiple times
			if tweet.retweeted? == false
				client.retweet tweet
			end
		end
	end


