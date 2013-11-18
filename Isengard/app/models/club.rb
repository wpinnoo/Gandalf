# == Schema Information
#
# Table name: clubs
#
#  id            :integer          not null, primary key
#  internal_name :string(255)
#  display_name  :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Club < ActiveRecord::Base

  has_many :events
  has_many :users

end
