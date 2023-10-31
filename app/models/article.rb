class Article < ApplicationRecord
    has_many :posts 
    # has_one_attached :avatar
    has_many_attached :avatars
end
