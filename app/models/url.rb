require 'active_record'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	before_create :shorten
	validates :long_url, presence: true, :format => {:with => /(^http:\/\/|https:\/\/)/}
	validates :long_url, uniqueness: true
	def shorten
		self.short_url = Array.new(5){[*"A".."Z", *"0".."9"].sample}.join
	end
end