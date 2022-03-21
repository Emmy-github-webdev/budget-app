class ActivitiesCategory < ApplicationRecord
  belongs_to :activities
  belongs_to :categories
end
