module Placeholder 
  extend ActiveSupport::Concern 

  def self.image_generator(height:, width:)
    "https://fakeimg.pl/#{height}x#{width}"
  end
end