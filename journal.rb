require 'json'

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
		entry_id =  (Random.rand * 10000).to_i

		#the way to generate uuid is requiring 'securerandom' module
		if (used_entry_ids.include? entry_id) == false
			used_entry_ids.push(entry_id)
		else
			generate_entry_id
		end

		return entry_id
	end

	def write_json
		return @entries.to_json
	end

	def parse_json entries
		return JSON.parse(entries)
	end

end

	journal = Journal.new

	journal.add_entry "1", "ABC", "me"
	journal.add_entry "2", "DEF", "me"
	journal.add_entry "3", "HIJK", "me"

