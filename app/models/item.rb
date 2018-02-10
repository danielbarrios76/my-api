class Item < ApplicationRecord
  
  include Statable
   has_many :bids, dependent: :destroy
  belongs_to :user

  mount_uploader :photo, FileUploader
  
  validates :name, :description, :finish_at, presence: true
  validates :initial_bid, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  markable_as :in_process, :cancelled, :finished

end
