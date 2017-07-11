class API
  include HTTParty
  base_uri 'http://simpliflyapi.info'

  def self.login email: "", password: ""
    res = self.post('/authentications', {body: {user: {email: email, password: password}}})
    return JSON.parse(res.body)["user"] if res.code == 200
  end

  def self.authenticate token: ""
    res = self.put('/authentications', {body: {token: token}})
    return JSON.parse(res.body)["user"] if res.code == 200
  end

  def self.updateSubscription token: "", subscription: {}
    self.put('/subscriptions', {body: {token: token, subscription: subscription}})
  end

  def self.createSubscription token: "", subscription: {}
    res = self.post('/subscriptions', {body: {token: token, subscription: subscription}})
    return JSON.parse(res.body) if res.code == 200
  end

  def self.deleteSubscription token: ""
    self.delete('/subscriptions', {body: {token: token}})
  end
end