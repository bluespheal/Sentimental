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


  # POST /textfiles or /textfiles.json
  def create
    @textfile = Textfile.new(textfile_params)

    respond_to do |format|
      if @textfile.save
        analyze(@textfile)
        format.html { redirect_to @textfile, notice: "Textfile was successfully created." }
        format.json { render :index, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
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
      params.require(:textfile).permit(:text_file)
    end

    def result_params
      params.require(:result).permit(:score_tag, :confidence, :agreement, :subjectivity, :irony, :text_excerpt)
      params.fetch(:result, {})
    end
    
    def analyze(textfile)
      require 'json'
      file_text = ''
      textfile.text_file.blob.open do |file|
        file_text = file.read
      end if textfile.text_file
      response = connect(file_text)
      create_analysis(textfile, file_text, response)
    end

    def create_analysis(textfile, file_text, response)
      @result = Result.create(
                              score_tag: JSON.parse(response.body)['score_tag'], 
                              agreement: JSON.parse(response.body)['agreement'],
                              confidence: JSON.parse(response.body)['confidence'],
                              subjectivity: JSON.parse(response.body)['subjectivity'],
                              agreement: JSON.parse(response.body)['agreement'],
                              irony: JSON.parse(response.body)['irony'],
                              text_excerpt: "#{file_text[0..20]}...",
                              )

      textfile.result_id = @result.id if @result
    end

    def connect(text)
      require "uri"
      require "net/http"
      params = { 
        key: Rails.application.credentials.meaning_cloud[:license_key],
        lang: "en",
        txt: text
      }
      Net::HTTP.post_form(URI.parse('https://api.meaningcloud.com/sentiment-2.1'), params)
    end
end
