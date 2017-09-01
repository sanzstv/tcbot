#queries.rb

module TCBotSearch
	#list of keyphrases to check for, need to find way to streamline
	@keyphrases = [	
			'disappearance',
			'disappearances',
			'unsolved crime',
			'unidentified',
			'IDed',
			'unresolved murder',
			'Jane Doe',
			'John Doe',
			'#amberalert',
			'Amber Alert',
			'mystery',
			'mysteries',
			'manhunt',
			'remains found',
			'missing person',
			'murder',
			'murders',
			'killing',
			'killings',
			'cold case'
		]

	def self.keyphrases
		return @keyphrases
	end
end
