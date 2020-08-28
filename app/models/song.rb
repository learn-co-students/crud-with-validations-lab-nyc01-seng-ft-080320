class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :title, uniqueness: { scope:  %i(release_year artist_name) }
    validates :released, inclusion: { in: [true, false] }
    # validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end
    
      def released?
        released
      end
    
    # validate :released_validator 
         

    # - Optional if `released` is `false`
    # - Must not be blank if `released` is `true`

   
end
