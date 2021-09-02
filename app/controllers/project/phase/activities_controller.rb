class Project::Phase::ActivitiesController < ApplicationController
    before_action :set_project_phase_activity, only: %i[ show edit update destroy ]
    
    # GET /project/phase/activities or /project/phase/activities.json
    def index
        @project_phase_activities = Project::Phase::Activity.where(project_phases_id: params[:phase_id])
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
        @project_phase_activity.project_phase = Project::Phase.find_by_id(params[:phase_id])
        if can? :create, @project_phase_activity

            respond_to do |format|
                if @project_phase_activity.save
                    format.html { redirect_to project_phase_activities_url, notice: "Activity was successfully created." }
                    format.json { render :show, status: :created, location: @project_phase_activity }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @project_phase_activity.errors, status: :unprocessable_entity }
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to project_phase_activities_url, notice: "You don't have privileges to create an activity." }
                format.json { render :show, status: :created, location: @project_phase_activity }
            end
        end
    end
    
    # PATCH/PUT /project/phase/activities/1 or /project/phase/activities/1.json
    def update
        if can? :update, @project_phase_activity
            respond_to do |format|
                if @project_phase_activity.update(project_phase_activity_params)
                    format.html { redirect_to "/projects/#{@project_phase_activity.project_phase.project.id}/phases/#{@project_phase_activity.project_phase.id}/activities/", notice: "Activity was successfully updated." }
                    format.json { render :show, status: :ok, location: @project_phase_activity }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                    format.json { render json: @project_phase_activity.errors, status: :unprocessable_entity }
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to project_phase_activities_url, notice: "You don't have privileges to update an activity." }
                format.json { render :show, status: :created, location: @project_phase_activity }
            end
        end
    end
    
    # DELETE /project/phase/activities/1 or /project/phase/activities/1.json
    def destroy
        if can? :destroy, @project_phase_activity
            @project_phase_activity.destroy
            respond_to do |format|
                format.html { redirect_to "/projects/#{@project_phase_activity.project_phase.project.id}/phases/#{@project_phase_activity.project_phase.id}/activities/", notice: "Activity was successfully updated." }
                format.json { head :no_content }
            end
        else
            respond_to do |format|
                format.html { redirect_to "/projects/#{@project_phase_activity.project_phase.project.id}/phases/#{@project_phase_activity.project_phase.id}/activities/", notice: "You don't have privileges to destroy an activity." }
                format.json { head :no_content }
            end 
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_phase_activity
        @project_phase_activity = Project::Phase::Activity.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def project_phase_activity_params
        params.fetch(:project_phase_activity, {}).permit(:name, :description, :start_date, :end_date)
    end
end
