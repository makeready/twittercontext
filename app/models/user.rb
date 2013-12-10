class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider         = auth["provider"]
      user.uid              = auth["uid"]
      user.name             = auth["info"]["name"]
      user.token            = auth['credentials']['token']
      user.secret           = auth['credentials']['secret']
      user.picture          = auth['extra']['raw_info']['profile_image_url']
      user.twitter_id       = auth['extra']['raw_info']['id_str']
      user.bgpic            = auth['extra']['raw_info']['profile_background_image_url']
    end
  end
end
