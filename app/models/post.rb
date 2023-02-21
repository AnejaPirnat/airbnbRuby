class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :title, :body, :adress, :city_id, :category_id, :price
    has_many :comments , dependent: :destroy
    scope :published, -> { where(published_at: nil).or(where("published_at <= ?", DateTime.now)) }
    has_rich_text :body
    has_many :categories
    belongs_to :city
    has_many_attached :images
    has_many :reservations
end