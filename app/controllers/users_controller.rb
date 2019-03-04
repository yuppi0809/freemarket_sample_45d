class UsersController < ApplicationController

  def index
  end

  def identification
    # @user = User.find(params[:id])
    # @address = Address.find_or_initialize_by(id: params[:id])
    # @year = (1900..2019).to_a.freeze
    # @month = (1..12).to_a.freeze
    # @day = (1..31).to_a.freeze
  end

  private
  # def user_params
  #   params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day)
  # end

end
