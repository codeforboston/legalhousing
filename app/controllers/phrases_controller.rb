class PhrasesController < ApplicationController
  before_action :set_phrase, only:[:show, :update, :edit, :destroy]
  def index
    @phrases = Phrase.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @phrase.delete
  end
  
  private
    def set_phrase
      @phrase = Phrase.find_by_id(params[:id])
    end
end
