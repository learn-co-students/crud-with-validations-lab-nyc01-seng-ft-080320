class Song < ApplicationRecord
validates :title, :released, presence: true 
validates :release_year, numericality: {less_than_or_equal_to: 2020}


end
