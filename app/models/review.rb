class Review < ApplicationRecord
  #serialize :content

  belongs_to :game
  belongs_to :user
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy

  # validates :review_title, presence: true#, length: {minimum: 5,maximum: 15}
  # validates :review_body, presence: true#, length: {minimum: 5,maximum: 300}
    def save_tag(sent_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      tags << new_post_tag
    end
  end

end
