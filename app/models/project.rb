class Project < ApplicationRecord
  #model_association
  has_many :milestones, dependent: :destroy

  #validations
  validates_presence_of :title, :created_by
end
