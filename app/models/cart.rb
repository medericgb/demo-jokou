class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :store

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
end
