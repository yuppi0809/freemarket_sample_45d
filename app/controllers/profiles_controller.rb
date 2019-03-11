class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]
  before_action :authenticate_user!

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(
      :prefecture,
      :city,
      :address,
      :postal_code,
      :building_name,
      :telephone_num,
      :delv_first_name,
      :delv_last_name,
      :delv_first_name_kana,
      :delv_last_name_kana
    )
  end

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end
end
