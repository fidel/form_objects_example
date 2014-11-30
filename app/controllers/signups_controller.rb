class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    respond_to do |format|
      if signup_service.call(@signup)
        format.html { redirect_to new_signup_path, notice: 'Signup successfull.' }
      else
        format.html { render new_signup_path }
      end
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:company_name, :name, :email)
  end

  def signup_service
    @signup_service ||= SignupService.new
  end
end
