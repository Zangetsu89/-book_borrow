class Reservation < ApplicationRecord
    belongs_to :books

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :approved, presence: true
    validates :cancelled, presence: true
    validates :payment, presence: true

end
