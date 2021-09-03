class Project::PhasesController < ApplicationController
    before_action :set_project_phase, only: %i[ show edit update destroy ]
    
    # GET /project/phases or /project/phases.json
    def index
        @project = Project.find_by_id(params[:project_id])
        @project_phases = @project.project_phase
    end
    
    # GET /project/phases/1 or /project/phases/1.json
    def show
        @phaseshow = Project.find_by_id(params[:project_id])
    end
    
    # GET /project/phases/new
    def new
        @phasenew = Project.find_by_id(params[:project_id])
        @project_phase = Project::Phase.new
    end
    
    # GET /project/phases/1/edit
    def edit
        @phaseedit = Project.find_by_id(params[:project_id])
    end
    
    # POST /project/phases or /project/phases.json
    def create
        @project_phase = Project::Phase.new(project_phase_params)
        #puts params[:project_id]
        @project_phase.project = Project.find_by_id(params[:project_id])
        if can? :create, @project_phase
        
            respond_to do |format|
                if @project_phase.save
                    format.html { redirect_to project_phases_url, notice: "Phase was successfully created." }
                    format.json { render :show, status: :created, location: @project_phase }
                else
                    format.html { render :new, status: :unprocessable_entity }
                    format.json { render json: @project_phase.errors, status: :unprocessable_entity }
                end
            end
        else
            respond_to do |format|
            format.html { redirect_to project_phases_url, notice: "You don't have privileges to create a phase." }
            format.json { render :show, status: :created, location: @project_phase }
            end
        end
    end
    
    # PATCH/PUT /project/phases/1 or /project/phases/1.json
    def update
        if can? :update, @project_phase
            respond_to do |format|
                if @project_phase.update(project_phase_params)
                    format.html { redirect_to project_phases_url(@project_phase.project,@phases), notice: "Phase was successfully updated." }
                    format.json { render :show, status: :ok, location: @project_phase }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                    format.json { render json: @project_phase.errors, status: :unprocessable_entity }
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to project_phases_url(@project_phase.project,@phases), notice: "You don't have privileges to update a phase." }
                format.json { render :show, status: :ok, location: @project_phase }
            end
        end
    end
    
    # DELETE /project/phases/1 or /project/phases/1.json
    def destroy
        if can? :destroy, @project_phase
            @project_phase.destroy
            respond_to do |format|
                format.html { redirect_to project_phases_url(@project_phase.project, @phases), notice: "Phase was successfully destroyed." }
                format.json { head :no_content }
            end
        else
            respond_to do |format|
                format.html { redirect_to project_phases_url(@project_phase.project, @phases), notice: "You don't have privileges to destroy a phase." }
                format.json { head :no_content }
            end
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
