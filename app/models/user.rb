class User < ApplicationRecord
    has_many :items, dependent: :destroy
    has_many :bids, dependent: :destroy

    validates :name, :email, presence: true
    validates :credits,            
            presence: true,
            numericality: { greater_than_or_equal_to: 0.0 }
    validates :email, uniqueness: true

    def avatar
        "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}"
    end
end
