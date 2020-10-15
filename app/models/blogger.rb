class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}
    validates :age, numericality: {greater_than: 0}

    def total_likes
        posts.sum {|p| p.likes}
    end

    def most_liked
        posts.max_by {|p| p.likes}
    end

    def destinations
    #   array = posts.map {|p| p.destination_id}.sort.reverse.tally
    #   array.each do |i|
    #     Destination.find(i).name
    #   end
    end

end
