require 'pry'

class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w[Fiction Non-Fiction]}

    validate :clickbait

    def clickbait
        if title
            keys = ["Won't Believe", "Secret", "Guess", "Top"]
            matches = keys.select {|key| title.include?(key)}
            if matches.empty?
                errors.add(:title, "must be clickbait!")
            end
        end
    end

end


