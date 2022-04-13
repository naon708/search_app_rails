class User < ApplicationRecord
  has_secure_password
  has_many :mark_programs, dependent: :destroy
  has_many :marked_program_lists, through: :mark_programs, source: :program

  validates :name, presence: true
  validates :name, uniqueness: { message: '他のニックネームをお試しください。' }
  validates :name, length: { in: 6..20 }

  def marking(program)
    marked_program_lists << program
  end
  
  def unmarking(program)
    marked_program_lists.destroy(program)
  end

  def marked?(program)
    marked_program_lists.include?(program)
  end
end
