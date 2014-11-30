class User < ActiveRecord::Base
  belongs_to :company

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
