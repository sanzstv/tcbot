#!/usr/bin/env ruby
require 'Twitter'
require_relative 'queries'
require_relative 'cache'

#`	this bot (still in progress) is meant to monitor crime/mystery related topics on The Twitter
#   caccepts optional list of queries as command line argument in the format:
# 		ruby twitterbot.rb "query 1" "query 2" ...
#   if no arguments are provided, file will default to list of queries specified in 'queries.rb'
	config = {
		  consumer_key: ENV['TWITTER_CKEY'],
		  consumer_secret: ENV['TWITTER_CSECRET'],
		  access_token: ENV['TWITTER_ACCESSTOKEN'],
		  access_token_secret: ENV['TWITTER_AT_SECRET']
	}
	client = Twitter::REST::Client.new(config)
	
	id = ReadCache()


	#TEST MSG
	search_params = {
		result_type: "recent",
		count: 5,
		lang: "en",
		since_id: id
	}
	queries = []
	if ARGV.length > 0
		ARGV.each do |query|
   			queries.push(query)
		end
	else
		queries= TCBotSearch.keyphrases
	end
	queries.each do |query|
		client.search(query, search_params).each do |tweet|
			#don't want to retweet multiple times
			if tweet.retweeted_status? == false
				client.retweet tweet
			end
		end
	end


