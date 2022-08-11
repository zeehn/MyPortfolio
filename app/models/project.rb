class Project < ApplicationRecord
  include Placeholder
  before_save :set_slug 

  validates :title, presence: true, uniqueness: true 
  validates :sub_title, :main_image_file_name, :thumb_image_file_name, presence: true 
  validates :description, length: { minimum: 25 }


  def to_param
    slug 
  end

  after_initialize :set_defaults 

  def set_defaults
    self.main_image_file_name ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image_file_name ||= Placeholder.image_generator(height: '350', width: '200')
  end

private
  def set_slug 
    self.slug = title.parameterize 
  end
end
