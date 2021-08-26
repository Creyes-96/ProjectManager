class Project::Phase::ActivitiesController < ApplicationController
  before_action :set_project_phase_activity, only: %i[ show edit update destroy ]

  # GET /project/phase/activities or /project/phase/activities.json
  def index
    @project_phase_activities = Project::Phase::Activity.all
  end

  # GET /project/phase/activities/1 or /project/phase/activities/1.json
  def show
  end

  # GET /project/phase/activities/new
  def new
    @project_phase_activity = Project::Phase::Activity.new
  end

  # GET /project/phase/activities/1/edit
  def edit
  end

  # POST /project/phase/activities or /project/phase/activities.json
  def create
    @project_phase_activity = Project::Phase::Activity.new(project_phase_activity_params)

    respond_to do |format|
      if @project_phase_activity.save
        format.html { redirect_to @project_phase_activity, notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @project_phase_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_phase_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/phase/activities/1 or /project/phase/activities/1.json
  def update
    respond_to do |format|
      if @project_phase_activity.update(project_phase_activity_params)
        format.html { redirect_to @project_phase_activity, notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @project_phase_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_phase_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/phase/activities/1 or /project/phase/activities/1.json
  def destroy
    @project_phase_activity.destroy
    respond_to do |format|
      format.html { redirect_to project_phase_activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_phase_activity
      @project_phase_activity = Project::Phase::Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_phase_activity_params
      params.fetch(:project_phase_activity, {})
    end
end
