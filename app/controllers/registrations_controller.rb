class RegistrationsController < ApplicationController
  def index
    @users = User.all
  end
  def create
    @user = User.new(params.require(:user).permit(:email))

    respond_to do |format|
      if @user.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.prepend("users_list", partial: "registrations/user", locals: { user: @user })
        }
        format.html { redirect_to users_path } # Fallback
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end
end
