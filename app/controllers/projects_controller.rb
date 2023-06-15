class ProjectsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :set_project, only: %i[ show update destroy ]

  # GET /projects
  def index
    #@projects = Project.all
    @projects = Project.paginate(:page => params[:page], :per_page => params[:per_page]).order('created_at DESC')
    # render json: @projects
    respond_to do |format|
      format.html
      format.json { @projects }
    end
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :created_by)
    end
end
