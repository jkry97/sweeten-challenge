class Contractor < ApplicationRecord
    has_many :contracts, dependent: :destroy
    has_one :home_owner, through: :contract

    validates :longitude, presence: true

    validates :latitude, presence: true

    validates :min_budget, presence: true

    validates :max_budget, presence: true

    validates :rating, numericality: true
end
