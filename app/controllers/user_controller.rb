class UserController < ApplicationController
    def projects
        user = User.find(params[:id])
        user_projects = UserProject.where(user: user).includes(:project) # Fetch UserProject records with associated projects
    
        # Map the user_projects to include project details and custom attributes
        projects = user_projects.map do |user_project|
          {
            project: user_project.project.as_json(only: [:id, :name, :image]),
            progress: user_project.progress,
            options: user_project.options
          }
        end
    
        render json: projects
    end
end