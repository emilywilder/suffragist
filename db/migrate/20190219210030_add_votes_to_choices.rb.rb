class AddVotesToChoices < ActiveRecord::Migration[5.2]
  def change
    add_column :choices, :votes, :integer, :default => 0
  end
end
