class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  
  def index
    @issues = Issue.all 
  end

  def new
    @issue = Issue.new
  end

  def show
  end

  def edit
  end

  def update
    @issue.update(issue_params)

    if @issue.save
      flash[:message] = "Phrase updated"
      render_formats
      redirect_to issue_path
    else
      render :edit 
    end
  end

  def create
    @issue = Issue.new
    @issue.update(issue_params)
    if @issue.save
      flash[:message] = "New Issue Added"
      redirect_to issues_path
    else
      render :new
    end
  end

  def destroy
  end

  private
  def set_issue
    @issue = Issue.find_by_id(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:id, :status, :category_id, :phrase_id, :listing_id, :content, :history)
  end

  def render_formats
    respond_to do |format|
      format.html
      format.json {render json: @listing.to_json}
    end
  end
end
