class ProjectsController < ApplicationController
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
    @project = Project.find(params[:id])
  end

  def edit 
    @project = Project.find(params[:id])
  end
  
  def update 
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project, notice: 'Project successfully updated!'
    else 
      render :edit 
    end
  end

private 
  def project_params 
    params.require(:project).permit(:title, :sub_title, :description, :main_image_file_name, :thumb_image_file_name)
  end
end
