class Category < ApplicationRecord
  has_many :order, dependent: :delete_all

  validates :name, uniqueness: true
end
