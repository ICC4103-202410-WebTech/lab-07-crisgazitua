class Tag < ApplicationRecord
    #has_many :post_tags
    has_and_belongs_to_many :posts, through: :post_tags

    validates :name, presence: { message: "Is required. Each tag must have a unique name." }, 
                    uniqueness: { message: "Has already been taken. Please use a diferent name." }
end