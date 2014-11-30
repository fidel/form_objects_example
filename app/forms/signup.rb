class Signup
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming

  attr_reader :company, :user

  attr_accessor :name, :company_name, :email

  def initialize(params={})
    params.each do |param, value|
      self.public_send(:"#{param}=", value)
    end
  end

  validates :company_name, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validate :email_uniqueness

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persisted?
    false
  end

  private

  def email_uniqueness
    errors.add(:email, "Email already exists") if User.where(email: email).exists?
  end

  def persist!
    @company = Company.create!(name: company_name)
    @user = @company.users.create!(name: name, email: email)
  end
end
