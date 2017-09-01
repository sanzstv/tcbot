#users.rb
require 'Twitter'

#get list of Friends (users that current user is following),
#search for their recent tweets and retweet them
config = {
	  consumer_key: ENV['TWITTER_CKEY'],
	  consumer_secret: ENV['TWITTER_CSECRET'],
	  access_token: ENV['TWITTER_ACCESSTOKEN'],
	  access_token_secret: ENV['TWITTER_AT_SECRET']
}
client = Twitter::REST::Client.new(config)

friends_list = client.friends.to_a


params = {
		include_rts: "true",
		exclude_replies: "false",
		count: 5
}
friends_list.each do |user|
	puts user.screen_name
	client.user_timeline(user.screen_name, params).each do |tweet|
		client.retweet tweet
	end
end