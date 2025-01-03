class List < ApplicationRecord
    has_many :items, dependent: :destroy
    validates :name, presence: true
    belongs_to :user
    
  end
  