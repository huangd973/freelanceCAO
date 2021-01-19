class Project < ApplicationRecord

    has_many :comments, dependent: :destroy
    resourcify
    belongs_to :user
    
    validates :name, :email, :description, :budget, presence: true
    validates :budget, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true

    after_update :notify_admin
    

    def notify_admin
        AdminMailer.with(project: self).project_updated.deliver_later
    end
end
