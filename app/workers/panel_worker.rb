class PanelWorker
  include Sidekiq::Worker

  def perform(first_name)
    Rails.logger.info("Hello #{name}!")
  end
end
