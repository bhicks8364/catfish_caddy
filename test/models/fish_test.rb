# == Schema Information
#
# Table name: fish
#
#  id            :integer          not null, primary key
#  color_id      :integer
#  weight        :decimal(, )
#  over_28       :boolean
#  tournament_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  returned      :boolean          default("false")
#  image_id      :string
#  member_id     :integer
#
# Indexes
#
#  index_fish_on_color_id       (color_id)
#  index_fish_on_member_id      (member_id)
#  index_fish_on_tournament_id  (tournament_id)
#

require 'test_helper'

class FishTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
