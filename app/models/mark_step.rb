class MarkStep < ApplicationRecord
  belongs_to :user
  belongs_to :step

  validates :user_id, uniqueness: { scope: :step_id }
end
