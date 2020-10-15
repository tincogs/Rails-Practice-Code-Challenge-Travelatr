class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_liked
        if posts == []
            "No Posts"
        else
            posts.max_by {|p| p.likes}.title
        end
    end

    def avg_age
        uniq_blogger = posts.map {|p| p.blogger}.uniq
        if uniq_blogger.count != 0
            uniq_blogger.sum {|b| b.age} / uniq_blogger.count
        else
            "No bloggers have been here"
        end
    end

end
