#     ('http://example.com/ufopooppenfiienkf7890eh3');"
# values = "('http://example.com/hfu2hiu3nkunkjniu4n3kjnjk'),
#     ('http://example.com/jhfwnkjnui4y7hkjnfjknkjnfk'),
#     ('http://example.com/uiejorunkuyengof68enf8oe'),

# File.read('db/testurls').each_line do |s|
# 	p s
# end
starttime = Time.now
@pie = ""
File.read('db/urls').each_line do |i|
	short_url = Array.new(5){[*"A".."Z", *"0".."9"].sample}.join
	i = i.gsub("\n", " ")
	i.insert(1, "'")
	i.insert(-4, "', '#{short_url}', '#{DateTime.now}', '#{DateTime.now.to_s}', 0")
	@pie << i
end
@pie = @pie[0..-3]
connection = ActiveRecord::Base.connection
connection.execute ("INSERT INTO urls (long_url, short_url, created_at, updated_at, counter) VALUES #{@pie}")
p Time.now - starttime 