class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validate :release_year_present_if_released
  validate :release_year_not_in_future

  def release_year_present_if_released
    if released == true && !release_year.present?
        errors.add(:release_year)
    end
  end

  def release_year_not_in_future
    if release_year.present? && release_year > Date.current.year
      errors.add(:release_year)
    end
  end
end
