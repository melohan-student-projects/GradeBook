class UserPromotionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_promotion, only: %i[ show edit update destroy ]
  before_action :require_teacher, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  def index
    redirect_to '/promotions'
  end

  def show
    redirect_to '/promotions'
  end

  def new
    @user_promotion = UserPromotion.new
  end

  def edit
    @user_promotion = UserPromotion.find(params[:id])
  end

  def create
    @user_promotion = UserPromotion.new(user_promotion_params)

    respond_to do |format|
      if @user_promotion.save
        format.html { redirect_to user_promotion_url(@user_promotion), notice: "user promotion was successfully created." }
        format.json { render :show, status: :created, location: @user_promotion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_promotion.update(user_promotion_params)
        format.html { redirect_to user_promotion_url(@user_promotion), notice: "user promotion was successfully updated." }
        format.json { render :show, status: :ok, location: @user_promotion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_promotion.destroy

    respond_to do |format|
      format.html { redirect_to user_promotions_url, notice: "user promotion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_user_promotion
    @user_promotion = UserPromotion.find(params[:id])
  end

  def user_promotion_params
    params.require(:user_promotion).permit(:promotion_id, :user_id)
  end

  def require_teacher
    if not current_user.teacher?
      redirect_to root_path, alert: "You're not allowed to access to this content."
    end
  end
end