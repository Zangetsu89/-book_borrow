class Book < ApplicationRecord
    has_many :reservations
    belongs_to :user

    validates :book_title, presence: true
    validates :isbn_number, presence: true
    validates :book_price, presence: true
    validates :description, presence: true
    validates :author, presence: true
    validates :location, presence: true
    validates :condition, presence: true
    has_one_attached :photo
    geocoded_by :location
    after_validation :geocode, if: :will_save_change_to_location?

end
