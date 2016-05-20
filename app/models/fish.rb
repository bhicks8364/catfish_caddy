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

class Fish < ActiveRecord::Base
    belongs_to :tournament
    belongs_to :color
    belongs_to :member
    attachment :image
    default_scope { order(created_at: :desc) }
    scope :returned, -> { where(returned: true) }
    scope :on_stringer, -> { where(returned: false) }
    validates :tournament_id, presence: true
    validates :color_id, uniqueness: { scope: [:tournament_id, :returned],
    message: "There's already a fish assigned to this color for this tournament." }, if: :on_stringer?
    
    def on_stringer?
        returned == false
    end
    
end
