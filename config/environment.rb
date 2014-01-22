# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Devi::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => 'app20074237@heroku.com',
    :password       => '8dd7vn2t',
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
}