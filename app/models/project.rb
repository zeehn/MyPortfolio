class Project < ApplicationRecord
  before_save :set_slug 

  validates :title, presence: true, uniqueness: true 
  validates :sub_title, :main_image_file_name, :thumb_image_file_name, presence: true 
  validates :description, length: { minimum: 25 }


  def to_param
    slug 
  end

private
  def set_slug 
    self.slug = title.parameterize 
  end
end
