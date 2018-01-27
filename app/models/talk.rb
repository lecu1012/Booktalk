class Talk < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :highlight, length: { maximum: 140 }
  validates :message,  presence: true, length: { maximum: 140 }
end
