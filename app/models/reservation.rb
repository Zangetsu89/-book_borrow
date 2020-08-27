class Reservation < ApplicationRecord
    belongs_to :book

    validates :start_date, presence: true
    validates :end_date, presence: true

end
