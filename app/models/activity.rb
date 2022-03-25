class Activity < ApplicationRecord
  belongs_to :author, class_name: 'User', dependent: :destroy
  has_and_belongs_to_many :categories

  validates_presence_of :name, :amount, :categories
end
