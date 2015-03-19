Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['njGTXTxtdSTUus7LaLWJBDPFx'], ENV['ngIe6hKdZM6acc7RKNveM0BCU3RoYCuiJKYOkZMlEETXpJzH95']
  # provider :facebook, ENV['841955125840893'], ENV['aac64eb77f808ec1c66e55c5fe8cd8fe']
  on_failure { |env| OmniauthCallbacksController.action(:failure).call(env) }

end
