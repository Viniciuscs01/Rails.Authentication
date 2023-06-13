class Milestone < ApplicationRecord
  belongs_to :project

  #validations
  validates_presence_of :title
end
