class SessionsController < Devise::SessionsController
  def new
    cookies[:url_before_login] = { value: request.referer, expires: 5.minutes.from_now }
    super
  end
end
