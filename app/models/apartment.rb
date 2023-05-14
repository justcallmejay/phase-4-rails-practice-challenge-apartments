class Apartment < ApplicationRecord
    has_many :leases
    has_many :tenants, through: :leases

    validates :number, presence: true
    validates :number, uniqueness: true

end
