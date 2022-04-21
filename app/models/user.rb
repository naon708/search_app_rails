class User < ApplicationRecord
  has_secure_password

  has_many :mark_programs, dependent: :destroy
  has_many :marked_program_lists, through: :mark_programs, source: :program

  has_many :mark_dancers, dependent: :destroy
  has_many :marked_dancer_lists, through: :mark_dancers, source: :dancer

  has_many :mark_steps, dependent: :destroy
  has_many :marked_step_lists, through: :mark_steps, source: :step

  has_many :mark_variations, dependent: :destroy
  has_many :marked_variation_lists, through: :mark_variations, source: :variation

  validates :name, presence: true
  validates :name, uniqueness: { message: '他のニックネームをお試しください。' }
  validates :name, length: { in: 6..20 }

  def marking(object)
    case object.class.name
    when 'Program'
      marked_program_lists << object
    when 'Dancer'
      marked_dancer_lists << object
    when 'Step'
      marked_step_lists << object
    when 'Variation'
      marked_variation_lists << object
    end
  end

  def unmarking(object)
    case object.class.name
    when 'Program'
      marked_program_lists.destroy(object)
    when 'Dancer'
      marked_dancer_lists.destroy(object)
    when 'Step'
      marked_step_lists.destroy(object)
    when 'Variation'
      marked_variation_lists.destroy(object)
    end
  end

  def marked?(object)
    case object.class.name
    when 'Program'
      marked_program_lists.include?(object)
    when 'Dancer'
      marked_program_lists.include?(object)
    when 'Step'
      marked_program_lists.include?(object)
    when 'Variation'
      marked_program_lists.include?(object)
    end
  end
end
