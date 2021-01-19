class Comment < ApplicationRecord
  belongs_to :project
  validates :description, :first_name, presence: true
end
