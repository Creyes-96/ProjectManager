class Project::TeamsController < ApplicationController
    before_action :set_project_team, only: %i[ show edit update destroy ]
    
    # GET /project/teams or /project/teams.json
    def index
        @project = Project.find_by_id(params[:project_id])
        @project_teams = Project::Team.where(projects_id: params[:project_id])
    end
    
    # GET /project/teams/1 or /project/teams/1.json
    def show
    end
    
    # GET /project/teams/new
    def new
        @projectnew = Project.find_by_id(params[:project_id])
        @project_team = Project::Team.new
    end
    
    # GET /project/teams/1/edit
    def edit
        @projectedit = Project.find_by_id(params[:project_id])
    end
    
    # POST /project/teams or /project/teams.json
    def create
        @project_team = Project::Team.new(project_team_params)
        @project_team.project = Project.find_by_id(params[:project_id])
        if can? :create, @project_team
            respond_to do |format|
                if @project_team.save
                    format.html { redirect_to project_teams_url, notice: "Member was successfully added." }
                    format.json { render :show, status: :created, location: @project_team }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @project_team.errors, status: :unprocessable_entity }
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to project_teams_url, notice: "You don't have privileges to add a member to the team." }
                format.json { render :show, status: :created, location: @project_phase }
            end
        end
    end
    
    # PATCH/PUT /project/teams/1 or /project/teams/1.json
    def update
        if can? :update, @project_team
            respond_to do |format|
                if @project_team.update(project_team_params)
                    format.html { redirect_to "/projects/#{@project_team.project.id}/teams/#{@project_team.id}", notice: "The member was successfully updated." }
                    format.json { render :show, status: :ok, location: @project_team }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                    format.json { render json: @project_team.errors, status: :unprocessable_entity }
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to "/projects/#{@project_team.project.id}/teams/#{@project_team.id}", notice: "You don't have privileges to update a member." }
                format.json { render :show, status: :ok, location: @project_phase }
            end
        end
    end
    
    # DELETE /project/teams/1 or /project/teams/1.json
    def destroy
        if can? :update, @project_team
            @project_team.destroy
            respond_to do |format|
                format.html { redirect_to project_teams_url, notice: "The member was successfully eliminated from the team." }
                format.json { head :no_content }
            end
        else
            respond_to do |format|
                format.html { redirect_to  project_teams_url(@project_team.project,@teams), notice: "You don't have privileges to eliminate a member." }
                format.json { head :no_content }
            end
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
