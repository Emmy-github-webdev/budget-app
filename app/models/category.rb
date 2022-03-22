class Category < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :activities_categories
  has_many :activities, through: :activities_categories
  validates_presence_of :name
end
