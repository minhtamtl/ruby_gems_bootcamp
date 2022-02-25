class Course < ApplicationRecord
  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user

   def to_s
      title
   end
  extend FriendlyId
  friendly_id :generated_slug, use: :slugged

  def generated_slug
    require 'securerandom'
    @random_slug ||= persisted? ? generated_slug : title + SecureRandom.hex(4)
  end
  LANGUAGES = [:"English", :"Vietnamese", :"Chinese", :"Spanish"]
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map { |level| [level, level] }
  end
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
end
