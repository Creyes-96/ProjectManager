class Project::Phase::MilestonesController < ApplicationController
  before_action :set_project_phase_milestone, only: %i[ show edit update destroy ]

  # GET /project/phase/milestones or /project/phase/milestones.json
  def index
    @project_phase_milestones = Project::Phase::Milestone.all
  end

  # GET /project/phase/milestones/1 or /project/phase/milestones/1.json
  def show
  end

  # GET /project/phase/milestones/new
  def new
    @project_phase_milestone = Project::Phase::Milestone.new
  end

  # GET /project/phase/milestones/1/edit
  def edit
  end

  # POST /project/phase/milestones or /project/phase/milestones.json
  def create
    @project_phase_milestone = Project::Phase::Milestone.new(project_phase_milestone_params)
    @project_phase_milestone.project_phase = Project::Phase.find_by_id(params[:phase_id])

    respond_to do |format|
      if @project_phase_milestone.save
        format.html { redirect_to project_phase_milestones_url, notice: "Milestone was successfully created." }
        format.json { render :show, status: :created, location: @project_phase_milestone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_phase_milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/phase/milestones/1 or /project/phase/milestones/1.json
  def update
    respond_to do |format|
      if @project_phase_milestone.update(project_phase_milestone_params)
        format.html { redirect_to @project_phase_milestone, notice: "Milestone was successfully updated." }
        format.json { render :show, status: :ok, location: @project_phase_milestone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_phase_milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/phase/milestones/1 or /project/phase/milestones/1.json
  def destroy
    @project_phase_milestone.destroy
    respond_to do |format|
      format.html { redirect_to project_phase_milestones_url, notice: "Milestone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_phase_milestone
      @project_phase_milestone = Project::Phase::Milestone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_phase_milestone_params
      params.fetch(:project_phase_milestone, {}).permit(:name, :description)
    end
end
