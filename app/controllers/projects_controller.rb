class ProjectsController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit, :create, :upate, :destroy]
    before_action :check_ownership, only: [:edit, :update, :destroy]
    #si je veux modifier edit avec admin, changer authentificate_user par fonction
    def index
        @projects = Project.page(params[:page])
    end

    def show
    end

    def new
        @project = Project.new
    end

    def edit
    end

    def create
        @project = current_user.projects.new(project_params)
        if @project.save
            flash[:notice] = "Project created"
            redirect_to projects_path
        else
            render :new
        end
    end

    def update
        if @project.update(project_params)
            flash[:notice] = "Project updated"
            redirect_to projects_path
        else
            render :edit
        end
    end

    def destroy
        @project.destroy
        flash[:notice] = "Project deleted"
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:name, :created_by, :email, :category, :description, :budget, :published_at)
    end

    def find_book
        @project = Project.find(params[:id])
    end

    def check_ownership
        unless current_user && current_user.has_role?(:admin)
            if current_user.id != @project.user_id
                flash[:alert] = "You didn't create this project !"
                redirect_to projects_path
            end
        end
    end
end