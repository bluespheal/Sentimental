class TextfilesController < ApplicationController
  before_action :set_textfile, only: %i[ show edit update destroy ]

  # GET /textfiles or /textfiles.json
  def index
    @textfiles = Textfile.all
  end

  # GET /textfiles/1 or /textfiles/1.json
  def show
  end

  # GET /textfiles/new
  def new
    @textfile = Textfile.new
  end

  # GET /textfiles/1/edit
  def edit
  end

  # POST /textfiles or /textfiles.json
  def create
    @textfile = Textfile.new(textfile_params)

    respond_to do |format|
      if @textfile.save
        format.html { redirect_to @textfile, notice: "Textfile was successfully created." }
        format.json { render :show, status: :created, location: @textfile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @textfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textfiles/1 or /textfiles/1.json
  def update
    respond_to do |format|
      if @textfile.update(textfile_params)
        format.html { redirect_to @textfile, notice: "Textfile was successfully updated." }
        format.json { render :show, status: :ok, location: @textfile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @textfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /textfiles/1 or /textfiles/1.json
  def destroy
    @textfile.destroy
    respond_to do |format|
      format.html { redirect_to textfiles_url, notice: "Textfile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_textfile
      @textfile = Textfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def textfile_params
      params.require(:textfile).permit(:file_url)
    end
end
