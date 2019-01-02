class UsersController < ApiController

  def create
    @user = User.first_or_create(post_params)

    if @user.save
      allow_token_to_be_used_only_once_for(@user)
      send_auth_token_for_valid_login_of(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: { message: "User destroyed!" }
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def send_auth_token_for_valid_login_of(user)
    render json: { token: user.token, user: {
      user_id: user.id, user_name: user.name, user_email: user.email, user_token: user.token
      }
    }
  end

  def allow_token_to_be_used_only_once_for(user)
    user.regenerate_token
  end

  def post_params
    params.permit(:name, :email, :password, :user)
  end
end