Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,'571538499270-sl2vs7cecq149e2p4e0ch5o614h87afu.apps.googleusercontent.com', '-tp1Zir8yKeRGcAsoJOp616Q',
    {
      scope: 'email, profile, plus.me, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50,
    }
end
