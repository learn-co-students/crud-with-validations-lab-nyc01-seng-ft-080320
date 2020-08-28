class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :release_year, presence: true, if: :released
    validate :yester_year?

    def yester_year?
        if self.release_year != nil
            errors.add(:release_year, "That's in the future")  if self.release_year > Date.today.year
        end
    end

end
