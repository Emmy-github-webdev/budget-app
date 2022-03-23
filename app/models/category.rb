class Category < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :activities_categories
  has_and_belongs_to_many :activities
  validates_presence_of :name

  def total_amount
    activities.sum(:amount)
  end
  
end
