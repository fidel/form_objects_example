class Signup

  ValidationError = Class.new(StandardError)

  include Virtus.model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :name, String
  attribute :company_name, String
  attribute :email, String

  validates :company_name, presence: true
  validates :email, presence: true
  validates :name, presence: true

  def persisted?
    false
  end

  def validate!
    raise ValidationError, errors unless valid?
  end
end
