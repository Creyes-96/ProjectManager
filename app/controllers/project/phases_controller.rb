class Project::PhasesController < ApplicationController
  before_action :set_project_phase, only: %i[ show edit update destroy ]

  # GET /project/phases or /project/phases.json
  def index
    @project_phases = Project::Phase.where(projects_id: params[:project_id])
  end

  # GET /project/phases/1 or /project/phases/1.json
  def show
  end

  # GET /project/phases/new
  def new
    @project_phase = Project::Phase.new
  end

  # GET /project/phases/1/edit
  def edit
  end

  # POST /project/phases or /project/phases.json
  def create
    @project_phase = Project::Phase.new(project_phase_params)
    #puts params[:project_id]
    
    @project_phase.project = Project.find_by_id(params[:project_id])

    respond_to do |format|
      if @project_phase.save
        format.html { redirect_to project_phases_url, notice: "Phase was successfully created." }
        format.json { render :show, status: :created, location: @project_phase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/phases/1 or /project/phases/1.json
  def update
    respond_to do |format|
      if @project_phase.update(project_phase_params)
        format.html { redirect_to project_phases_url, notice: "Phase was successfully updated." }
        format.json { render :show, status: :ok, location: @project_phase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/phases/1 or /project/phases/1.json
  def destroy
    @project_phase.destroy
    respond_to do |format|
      format.html { redirect_to project_phases_url, notice: "Phase was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_phase
      @project_phase = Project::Phase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_phase_params
      params.fetch(:project_phase, {}).permit(:name, :description, :start_date, :end_date)
    end
end
