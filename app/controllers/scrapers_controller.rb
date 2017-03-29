class ScrapersController < ApplicationController
  before_action :set_scraper, only: [:show, :edit, :update, :destroy]

  # GET /scrapers
  # GET /scrapers.json
  def index
    @scrapers = Scraper.all
  end

  # GET /scrapers/1
  # GET /scrapers/1.json
  def show
    
  end

  # GET /scrapers/new
  def new
    @scraper = Scraper.new
  end

  # GET /scrapers/1/edit
  def edit
  end

  # POST /scrapers
  # POST /scrapers.json
  def create
    @scraper = Scraper.new(scraper_params)

    respond_to do |format|
      if @scraper.save
        format.html { redirect_to @scraper, notice: 'Scraper was successfully created.' }
        format.json { render :show, status: :created, location: @scraper }
      else
        format.html { render :new }
        format.json { render json: @scraper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrapers/1
  # PATCH/PUT /scrapers/1.json
  def update
    respond_to do |format|
      if @scraper.update(scraper_params)
        format.html { redirect_to @scraper, notice: 'Scraper was successfully updated.' }
        format.json { render :show, status: :ok, location: @scraper }
      else
        format.html { render :edit }
        format.json { render json: @scraper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapers/1
  # DELETE /scrapers/1.json
  def destroy
    @scraper.destroy
    respond_to do |format|
      format.html { redirect_to scrapers_url, notice: 'Scraper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraper
      @scraper = Scraper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraper_params
      params.fetch(:scraper, {})
    end
end
