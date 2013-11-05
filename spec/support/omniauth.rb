OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    :provider => 'twitter',
    :uid => '9999',
    :info => {
      :name => 'ABCXYZ',
      :email => 'abc@abc.com'
    },
    :credentials => {:token => 'token-twitter'}
    })
OmniAuth.config.mock_auth[:stripe_connect] = OmniAuth::AuthHash.new({
    :provider => 'stripe_connect',
    :uid => '9999',
    :info => {
      :stripe_publishable_key => 'pk_000'
    },
    :credentials => {:token => 'st_token'}
    })
