class Visit < ApplicationRecord
    validates :school, :contact_name, :email, :visit_date, :students_count, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :status, inclusion: { in: %w[pending approved rejected completed] }
    validates :students_count, numericality: { greater_than: 0 }
end
