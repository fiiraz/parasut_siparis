class Order < ApplicationRecord
  CURRENCIES = %w(TRY USD EUR).freeze

  belongs_to :category

  enum currency: Order::CURRENCIES.map{|currency| [currency, currency]}.to_h

  validates :currency, presence: true, inclusion: { in: Order::CURRENCIES }
  validates :gross_amount, presence: true
  validates :category_id, presence: true
  validates :gross_amount, numericality: { greater_than: :discount_amount }

  def net_amount
    gross_amount - discount_amount
  end

end
