class SignupService
  def call(form_object)
    form_object.validate!

    ActiveRecord::Base.transaction do
      company = Company.create!(name: form_object.company_name)
      User.create!(name: form_object.name, email: form_object.email, company: company)
    end

    form_object
  rescue form_object.class::ValidationError
    false
  rescue ActiveRecord::RecordNotUnique
    form_object.errors.add(:email, "Email already exists")
    false
  end
end
