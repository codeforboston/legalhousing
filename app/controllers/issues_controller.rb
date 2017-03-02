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
      redirect_to issue_path
      render_formats
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

  def issue_params
    params.require(:issue).permit(:listing_id, :issue_id, :content)
  end
end
