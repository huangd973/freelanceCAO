class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.project_updated.subject
  #
  def project_updated
    @project = params[:project]

    mail to: "mrcaoevan@gmail.com"
  end
end
