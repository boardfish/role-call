# frozen_string_literal: true

# ApplicationMailer: handles emails sent by the application.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
