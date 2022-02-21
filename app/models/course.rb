class Course < ApplicationRecord
validates :title,  presence: true
has_rich_text :description 

  belongs_to :user

 def to_s
    title
 end
extend FriendlyId
friendly_id :generated_slug, use: :slugged

def generated_slug
  require 'securerandom'
  @random_slug ||= persisted? ? generated_slug : title + " "+SecureRandom.hex(4)
end
end
