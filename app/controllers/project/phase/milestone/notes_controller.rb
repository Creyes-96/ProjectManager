class Project::Phase::Milestone::NotesController < ApplicationController
    before_action :set_project_phase_milestone_note, only: %i[ show edit update destroy ]
    
    # GET /project/phase/milestone/notes or /project/phase/milestone/notes.json
    def index
        @project_phase_milestone_notes = Project::Phase::Milestone::Note.where(project_phase_milestones_id: params[:milestone_id])
    end
    
    # GET /project/phase/milestone/notes/1 or /project/phase/milestone/notes/1.json
    def show
    end
    
    # GET /project/phase/milestone/notes/new
    def new
        @project_phase_milestone_note = Project::Phase::Milestone::Note.new
    end
    
    # GET /project/phase/milestone/notes/1/edit
    def edit
    end
    
    # POST /project/phase/milestone/notes or /project/phase/milestone/notes.json
    def create
        @project_phase_milestone_note = Project::Phase::Milestone::Note.new(project_phase_milestone_note_params)
        @project_phase_milestone_note.project_phase_milestone = Project::Phase::Milestone.find_by_id(params[:milestone_id])
        @project_phase_milestone_note.user = current_user
        
        respond_to do |format|
            if @project_phase_milestone_note.save
                format.html { redirect_to project_phase_milestone_notes_url, notice: "Note was successfully created." }
                format.json { render :show, status: :created, location: @project_phase_milestone_note }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @project_phase_milestone_note.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # PATCH/PUT /project/phase/milestone/notes/1 or /project/phase/milestone/notes/1.json
    def update
        if can? :update, @project_phase_milestone_note
            respond_to do |format|
                if @project_phase_milestone_note.update(project_phase_milestone_note_params)
                    format.html { redirect_to "/projects/#{@project_phase_milestone_note.project_phase_milestone.project_phase.project.id}/phases/#{@project_phase_milestone_note.project_phase_milestone.project_phase.id}/milestones/#{@project_phase_milestone_note.project_phase_milestone.id}/notes/#{@project_phase_milestone_note.id}" , notice: "Note was successfully updated." }
                    format.json { render :show, status: :ok, location: @project_phase_milestone_note }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                    format.json { render json: @project_phase_milestone_note.errors, status: :unprocessable_entity }
                end
            end
        end
    end
    
    # DELETE /project/phase/milestone/notes/1 or /project/phase/milestone/notes/1.json
    def destroy
        if can? :update, @project_phase_milestone_note
            @project_phase_milestone_note.destroy
            respond_to do |format|
                format.html { redirect_to "/projects/#{@project_phase_milestone_note.project_phase_milestone.project_phase.project.id}/phases/#{@project_phase_milestone_note.project_phase_milestone.project_phase.id}/milestones/#{@project_phase_milestone_note.project_phase_milestone.id}/notes", notice: "Note was successfully destroyed." }
                format.json { head :no_content }
            end
        else
            respond_to do |format|
                format.html { redirect_to "/projects/#{@project_phase_milestone_note.project_phase_milestone.project_phase.project.id}/phases/#{@project_phase_milestone_note.project_phase_milestone.project_phase.id}/milestones/#{@project_phase_milestone_note.project_phase_milestone.id}/notes", notice: "You can't delete other users notes." }
                format.json { render :show, status: :created, location: @project_phase_activity }
            end
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_phase_milestone_note
        @project_phase_milestone_note = Project::Phase::Milestone::Note.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def project_phase_milestone_note_params
        params.fetch(:project_phase_milestone_note, {}).permit(:note)
    end
end
