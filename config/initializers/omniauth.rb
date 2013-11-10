Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET'],:client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } }

  provider :identity  #,  :on_failed_registration => UsersController.action(:new)

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end