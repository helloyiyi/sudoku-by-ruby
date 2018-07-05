class Number < ApplicationRecord
    validates :index, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 9}
    validates :value, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 3}
    validates_uniqueness_of :index 

end
