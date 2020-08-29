class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction),
        message: "%{value} is not a valid category" }
    validate :title_is_clickbait 

    

    def title_is_clickbait
        click_bait_patterns = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]
        if click_bait_patterns.none? {|pattern| pattern.match title }
            errors.add(:title, "must be clickbait")
        end
    end 

end
