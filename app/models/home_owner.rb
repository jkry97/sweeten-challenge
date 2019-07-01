class HomeOwner < ApplicationRecord
    has_one :contract, dependent: :destroy
    has_one :contractor, through: :contract
    validates :longitude, presence: true

    validates :latitude, presence: true

    validates :min_budget, presence: true

    validates :max_budget, presence: true
end
