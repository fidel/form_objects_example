class Signup
  include ActiveModel::Model

  include Virtus.model

  attr_reader :user
  attr_reader :company

  attribute :name, String
  attribute :company_name, String
  attribute :email, String

  validates :company_name, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validate :email_uniqueness

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
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
