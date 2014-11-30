class SignupsController < ApplicationController
  def new
    @company = Company.new
    @user    = @company.users.build
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to new_signup_path, notice: 'Signup successfull.' }
      else
        format.html { render new_signup_path }
      end
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, users_attributes: [:name, :email])
  end
end
