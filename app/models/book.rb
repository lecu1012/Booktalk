class Book < ApplicationRecord
  has_many :talks, dependent: :destroy
end
