class Project::TeamsController < ApplicationController
  before_action :set_project_team, only: %i[ show edit update destroy ]

  # GET /project/teams or /project/teams.json
  def index
    @project_teams = Project::Team.all
  end

  # GET /project/teams/1 or /project/teams/1.json
  def show
  end

  # GET /project/teams/new
  def new
    @project_team = Project::Team.new
  end

  # GET /project/teams/1/edit
  def edit
  end

  # POST /project/teams or /project/teams.json
  def create
    @project_team = Project::Team.new(project_team_params)
    @project_team.project = Project.find_by_id(params[:project_id])
    respond_to do |format|
      if @project_team.save
        format.html { redirect_to project_teams_url, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @project_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/teams/1 or /project/teams/1.json
  def update
    respond_to do |format|
      if @project_team.update(project_team_params)
        format.html { redirect_to @project_team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @project_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/teams/1 or /project/teams/1.json
  def destroy
    @project_team.destroy
    respond_to do |format|
      format.html { redirect_to project_teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_team
      @project_team = Project::Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_team_params
      params.fetch(:project_team, {}).permit(:users_id)
    end
end
