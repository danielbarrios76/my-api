class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :item

  valitades :user, :item, presence: true
  validates :used_credits, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

end
