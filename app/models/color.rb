# == Schema Information
#
# Table name: colors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Color < ActiveRecord::Base
    has_many :fish
end
