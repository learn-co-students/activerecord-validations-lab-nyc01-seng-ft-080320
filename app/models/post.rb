require 'pry'

class Post < ActiveRecord::Base

    # validates_length_of :content, minimum: 250, maximum: 250
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :click_bait

    def click_bait
        unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") 
            errors.add(:title, "Not Click Bait :(")
        end
    end
    
end
