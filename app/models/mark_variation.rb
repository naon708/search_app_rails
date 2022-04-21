class MarkVariation < ApplicationRecord
  belongs_to :user
  belongs_to :variation

  validates :user_id, uniqueness: { scope: :variation_id }
end
