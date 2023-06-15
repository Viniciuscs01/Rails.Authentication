class Project < ApplicationRecord
  #model_association
  has_many :milestones, dependent: :destroy

  #validations
  validates_presence_of :title, :created_by

  def as_json(options = nil)
    hash = super(:include => {:milestones => {:except => [:updated_at, :project_id]}})

    hash.store(:project_title, hash.delete("title"))

    hash[:created_at] = self.created_at.to_time.to_i
    hash[:updated_at] = self.created_at.to_time.to_i
    # hash[:start_date] = self.created_at.to_time.to_i
    # hash[:end_date] = self.created_at.to_time.to_i

    hash[:is_single_day_project] = is_single_day_project
    return hash
  end

  private
  def is_single_day_project
    #Time.at(self.start_date).to_date === Time.at(self.end_date).to_date
    return true
  end
end
