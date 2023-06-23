class Book < ApplicationRecord
   has_one_attached :image
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { in: 1..200 }


   def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
