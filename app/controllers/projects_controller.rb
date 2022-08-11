class ProjectsController < ApplicationController
  layout "projects"
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index], user: {except: [:new, :create, :edit, :update, :destroy]}, admin: :all

  def index 
    @projects = Project.all 
  end

  def new 
    @project = Project.new 
  end

  def create 
    @project = Project.new(project_params)

    if @project.save 
      redirect_to @project, notice: 'Project successfully created!'
    else
      render :new 
    end
  end

  def show 
  end

  def edit 
  end
  
  def update 
    if @project.update(project_params)
      redirect_to @project, notice: 'Project successfully updated!'
    else 
      render :edit 
    end
  end

  def destroy 
    @project.destroy 
    redirect_to projects_path 
  end

private 
  def set_project 
    @project = Project.find_by!(slug: params[:id])
  end

  def project_params 
    params.require(:project).permit(:title, :sub_title, :description, :main_image_file_name, :thumb_image_file_name, technology_ids: [])
  end
end
