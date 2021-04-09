class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :place
    validates :time
    validates :more
    validates :image
  end
end
