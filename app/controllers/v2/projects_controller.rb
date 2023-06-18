module V2
  class ProjectsController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :set_project, only: %i[ show update destroy ]

    # GET /projects
    def index
      p "v2"
      @projects = Project.paginate(:page => params[:page], :per_page => params[:per_page]).order('created_at DESC')
      respond_to do |format|
        format.html
        format.json { @projects }
      end
    end
  end
end
