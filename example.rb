require 'alchemyapi'

demo_text = 'Yesterday dumb Bob destroyed my fancy iPhone in beautiful Denver, Colorado. I guess I will have to head over to the Apple Store and buy a new one.'
demo_url = 'http://blog.programmableweb.com/2011/09/16/new-api-billionaire-text-extractor-alchemy/'
demo_html = '<html><head><title>Python Demo | alchemyapi</title></head><body><h1>Did you know that alchemyapi works on HTML?</h1><p>Well, you do now.</p></body></html>'

alchemyapi = AlchemyAPI.new()


puts ''
puts ''
puts '############################################'
puts '#   Entity Extraction Example              #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.entities('text', demo_text, { 'sentiment'=>1 })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Entities ##'
	for entity in response['entities']
		puts 'text: ' + entity['text']
		puts 'type: ' + entity['type']
		puts 'relevance: ' + entity['relevance']
		puts 'sentiment: ' + entity['sentiment']['type'] + ' (' +entity['sentiment']['score'] + ')'
		puts ''
	end
else
	puts 'Error in entity extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Sentiment Analysis Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing html: ' + demo_html
puts ''

response = alchemyapi.sentiment('html', demo_html)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Document Sentiment ##'
	puts 'type: ' + response['docSentiment']['type']
	puts 'score: ' + response['docSentiment']['score']
else
	puts 'Error in sentiment analysis call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Keyword Extration Example               #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.keywords('text', demo_text, { 'sentiment'=>1 })

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Keywords ##'
	for keyword in response['keywords']
		puts 'text: ' + keyword['text']
		puts 'relevance: ' + keyword['relevance']
		puts 'sentiment: ' + keyword['sentiment']['type'] + ' (' + keyword['sentiment']['score'] + ')'
		puts ''
	end
else
	puts 'Error in keyword extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Concept Tagging Example                 #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.concepts('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Concepts ##'
	for concept in response['concepts']
		puts 'text: ' + concept['text']
		puts 'relevance: ' + concept['relevance']
		puts ''
	end
else
	puts 'Error in concept tagging call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Relation Extraction Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.relations('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Relations ##'
	for relation in response['relations']
		if relation.key?('subject')
			puts 'subject: ' + relation['subject']['text']
		end

		if relation.key?('action')
			puts 'action: ' + relation['action']['text']
		end

		if relation.key?('object')
			puts 'object: ' + relation['object']['text']
		end
		puts ''
	end
else
	puts 'Error in relation extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Text Categorization Example            #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.category('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Category ##'
	puts 'text: ' + response['category']
	puts 'score: ' + response['score']
else
	puts 'Error in text categorization call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Language Detection Example             #'
puts '############################################'
puts ''
puts ''

puts 'Processing text: ' + demo_text
puts ''

response = alchemyapi.language('text', demo_text)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Language ##'
	puts 'text: ' + response['language']
	puts 'iso-639-1: ' + response['iso-639-1']
	puts 'native speakers: ' + response['native-speakers']
else
	puts 'Error in language detection call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#   Author Extraction Example              #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.author('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Author ##'
	puts 'author: ' + response['author']
else
	puts 'Error in author extraction call: ' + response['statusInfo']
end


puts ''
puts ''
puts ''
puts '############################################'
puts '#  Feed Detection Example                  #'
puts '############################################'
puts ''
puts ''

puts 'Processing url: ' + demo_url
puts ''

response = alchemyapi.feeds('url', demo_url)

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Feeds ##'
	for feed in response['feeds']
		puts 'feed: ' + feed['feed']
	end
else
	puts 'Error in feed detection call: ' + response['statusInfo']
end


puts ''
puts ''

