#require_relative "../views/comments/create"
#require_relative "../assets/javascripts/show"

class CommentsController < ApplicationController
    def create
        session[:return_to] ||= request.referer
        project = Project.find(params[:project_identifier])
        @comment = project.comments.new(comment_params)
        @comment.save
        redirect_to session.delete(:return_to)

    end

    private

        def comment_params
            params.require(:comment).permit(:description, :first_name)
        end
end