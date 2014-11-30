class Company < ActiveRecord::Base
  has_many :users

  accepts_nested_attributes_for :users

  validates :name, presence: true
end
