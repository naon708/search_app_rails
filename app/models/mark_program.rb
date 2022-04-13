class MarkProgram < ApplicationRecord
  belongs_to :user
  belongs_to :program

  validates :user_id, uniqueness: { scope: :program_id }
end
