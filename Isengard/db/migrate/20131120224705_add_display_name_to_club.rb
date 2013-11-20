class AddDisplayNameToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :display_name, :string
  end
end
