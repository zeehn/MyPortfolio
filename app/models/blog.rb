class Blog < ApplicationRecord 
  belongs_to :category 
  
  enum status: { draft: 0, published: 1 }

  validates :title, :body, presence: true 
end