class Journal
	attr_accessor :entries
	attr_accessor :used_entry_ids

	def initialize 
		@entries = {};
		@used_entry_ids = []
	end

	def add_entry title, content, author
		entry = {
			title: "#{title}",
			content: "#{content}",
			author: "#{author}"
		}

		entry_id = generate_entry_id

		@entries[entry_id] = entry
	end


	def generate_entry_id
		entry_id =  (Random.rand * 1000).to_i

		#the way to generate uuid is requiring 'securerandom' module
		if (used_entry_ids.include? entry_id) == false
			used_entry_ids.push(entry_id)
		else
			generate_entry_id
		end

		return entry_id
	end
end

	journal = Journal.new

	journal.add_entry "my title", "my content", "me"
	journal.add_entry "my title 2", "my content 2", "me 2"

	puts journal.entries

