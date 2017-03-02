class PhrasesController < ApplicationController
  before_action :set_phrase, only:[:show, :update, :edit, :destroy]
  
  def import_phrases
    Phrase.import_phrases
    redirect_to phrases_path
  end

  def scrub_phrases
    Phrase.scrub_phrases
    redirect_to phrases_path
  end

  def index
    @phrases = Phrase.all.order('content')
  end

  def show
  end

  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new
    @phrase.update(phrase_params)
    if @phrase.save
      flash[:message] = "New Phrase Added"
      redirect_to phrases_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @phrase.update(phrase_params)
    if @phrase.save
      flash[:message] = "Phrase updated"
      redirect_to phrase_path
      render_formats
    else
      render :edit 
    end
  end

  def destroy
    @phrase.destroy
    flash[:messag] = "Phrase deleted."
    redirect_to phrases_path
  end

  private
    def set_phrase
      @phrase = Phrase.find_by_id(params[:id])
    end

    def phrase_params
      params.require(:phrase).permit(:content, :category, :subcategory, :discriminatory_issue)
    end

    def render_formats
      respond_to do |format|
        format.html
        format.json {render json: @listing.to_json}
      end
    end
end
