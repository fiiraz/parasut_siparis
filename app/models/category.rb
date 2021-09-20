class Category < ApplicationRecord
  # I've tried CASCADE Delete All too.
  # has_many :order, dependent: :delete_all
  has_many :order, dependent: :nullify

  validates :name, uniqueness: true
end
