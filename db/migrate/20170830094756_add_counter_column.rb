class AddCounterColumn < ActiveRecord::Migration[5.0]
	def change
		add_column :urls, :counter, :integer
	end
end
