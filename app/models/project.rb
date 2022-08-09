class Project < ApplicationRecord
  before_save :set_slug 

  validates :title, presence: true, uniqueness: true 

  def to_param
    slug 
  end

private
  def set_slug 
    self.slug = title.parameterize 
  end
end
