class RemoveClubFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :club, :string
  end
end
