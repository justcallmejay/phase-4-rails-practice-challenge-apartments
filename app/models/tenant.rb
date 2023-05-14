class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments, through: :leases

    validates :name, presence: true
    validates :age, numericalilty => {greater_than_or_equal: 18}

end
