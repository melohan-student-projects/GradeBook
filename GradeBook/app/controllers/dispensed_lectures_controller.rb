class DispensedLecturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dispensed_lecture, only: %i[ show edit update destroy ]
  before_action :require_teacher_or_admin, only: [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /dispensed_lectures or /dispensed_lectures.json
  def index
    redirect_to '/lectures'
  end

  # GET /dispensed_lectures/1 or /dispensed_lectures/1.json
  def show
    redirect_to '/lectures'
  end

  # GET /dispensed_lectures/new
  def new
    @dispensed_lecture = DispensedLecture.new
  end

  # GET /dispensed_lectures/1/edit
  def edit
    @dispensed_lecture = DispensedLecture.find(params[:id])
  end

  # POST /dispensed_lectures or /dispensed_lectures.json
  def create
    @dispensed_lecture = DispensedLecture.new(dispensed_lecture_params)

    respond_to do |format|
      if @dispensed_lecture.save
        format.html { redirect_to dispensed_lecture_url(@dispensed_lecture), notice: "Dispensed lecture was successfully created." }
        format.json { render :show, status: :created, location: @dispensed_lecture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dispensed_lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispensed_lectures/1 or /dispensed_lectures/1.json
  def update
    respond_to do |format|
      if @dispensed_lecture.update(dispensed_lecture_params)
        format.html { redirect_to dispensed_lecture_url(@dispensed_lecture), notice: "Dispensed lecture was successfully updated." }
        format.json { render :show, status: :ok, location: @dispensed_lecture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dispensed_lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispensed_lectures/1 or /dispensed_lectures/1.json
  def destroy
    @dispensed_lecture.destroy

    respond_to do |format|
      format.html { redirect_to dispensed_lectures_url, notice: "Dispensed lecture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispensed_lecture
      @dispensed_lecture = DispensedLecture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dispensed_lecture_params
      params.require(:dispensed_lecture).permit(:lecture_id, :promotion_id, :semester_id, :user_id)
    end

  def require_teacher_or_admin
    if current_user.user_type.slug != 'TEA' && current_user.user_type.slug != 'ADM'
      redirect_to root_path, alert: "You're not alowed to access to this content."
    end
  end

end
