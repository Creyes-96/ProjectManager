class User::NotesController < ApplicationController
  before_action :set_user_note, only: %i[ show edit update destroy ]

  # GET /user/notes or /user/notes.json
  def index
    @user_notes = User::Note.all
  end

  # GET /user/notes/1 or /user/notes/1.json
  def show
  end

  # GET /user/notes/new
  def new
    @user_note = User::Note.new
  end

  # GET /user/notes/1/edit
  def edit
  end

  # POST /user/notes or /user/notes.json
  def create
    @user_note = User::Note.new(user_note_params)

    respond_to do |format|
      if @user_note.save
        format.html { redirect_to @user_note, notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @user_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/notes/1 or /user/notes/1.json
  def update
    respond_to do |format|
      if @user_note.update(user_note_params)
        format.html { redirect_to @user_note, notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @user_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/notes/1 or /user/notes/1.json
  def destroy
    @user_note.destroy
    respond_to do |format|
      format.html { redirect_to user_notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_note
      @user_note = User::Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_note_params
      params.fetch(:user_note, {})
    end
end
