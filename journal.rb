class Journal
	attr_accessor :something

	def initialize 
		@something = "some string";
	end

end

my_journal = Journal.new

puts my_journal.something