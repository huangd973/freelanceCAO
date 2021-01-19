# Preview all emails at http://localhost:3000/rails/mailers/admin
class AdminPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin/project_updated
  def project_updated
    AdminMailer.with(project: Project.first).project_updated
  end

end
