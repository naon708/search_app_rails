class MarkDancer < ApplicationRecord
  belongs_to :user
  belongs_to :dancer

  validates :user_id, uniqueness: { scope: :dancer_id }
end
