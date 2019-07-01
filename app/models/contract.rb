class Contract < ApplicationRecord
  belongs_to :home_owner
  belongs_to :contractor

  validates_uniqueness_of :home_owner_id, :scope => :contractor_id, :message => "One renovation can be assigend to only one contractor."
  validate :prohibit_more_than_three_project

  validates :home_owner_id, presence: true

  validates :contractor_id, presence: true


  def prohibit_more_than_three_project
    if Contract.where(contractor_id: contractor_id).count >= 3
      errors.add(:contractor_id, "One contractor can't be asigned more than three projects")
    end
  end
end
