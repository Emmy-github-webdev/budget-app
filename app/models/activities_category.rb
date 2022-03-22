class ActivitiesCategory < ApplicationRecord
  belongs_to :activities, dependent: :destroy
  belongs_to :categories, dependent: :destroy
end
