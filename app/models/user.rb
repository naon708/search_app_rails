class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: { message: '他のニックネームをお試しください。' }
  validates :name, length: { in: 6..20 }
end
