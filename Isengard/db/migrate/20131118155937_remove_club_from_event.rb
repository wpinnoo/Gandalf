class RemoveClubFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :club, :string
  end
end
