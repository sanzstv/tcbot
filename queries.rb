#queries.rb

module TCBotSearch
	#list of keyphrases to check for, obviously need to find way to streamline
	@keyphrases = [	
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

	def self.keyphrases
		return @keyphrases
	end
end
