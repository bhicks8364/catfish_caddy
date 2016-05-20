# == Schema Information
#
# Table name: tournaments
#
#  id         :integer          not null, primary key
#  name       :string
#  location   :string
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string
#

class Tournament < ActiveRecord::Base
    has_many :fish
    has_many :stringer_fish, -> { where(returned: false) }, class_name: "Fish"
    has_many :colors, through: :stringer_fish
    has_many :members, through: :fish
    scope :current, -> { where(status: "Open")}
    scope :upcoming, -> {
                    start = Date.current
                    ending = Date.current + 14.days
                    where(date: start...ending)}
    def to_param
        if name.present?
            "#{id}-#{name.parameterize }"
        end
    end
    def stringer_total
        fish.where(returned: false).sum(:weight)
    end
    def returned_total
        fish.where(returned: true).sum(:weight)
    end
    
    def self.latest
        order('date desc').first
    end
    
    def on_deck
        fish.on_stringer.order(weight: :desc).last
    end
    
    def current?
        date == Date.current.to_date
    end
    
    def available_colors
        all_colors = Color.all
        all_colors - colors
    end
    
    
    
end
