class Item < ApplicationRecord
  belongs_to :list
  validates :name, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
