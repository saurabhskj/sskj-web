OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '236312443220634', '58fb3e8e12dac558c6d784fbdff2ed2f',
 # provider :facebook, '592636800810357', '0d00016d51484f3cd2a64c538bb8000c',
            :scope => 'email'
end
OmniAuth.config.on_failure = Proc.new do |env| new_path = "/auth/failure"
[302, {'Location' => new_path, 'Content-Type'=> 'text/html'}, []]
end
