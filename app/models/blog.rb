class Blog < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { maximum: 100 }
    validates :description, presence: true, length: { minimum: 20 }
end
