class UnsuspensionNotification < ApplicationMailer

  def notification(innovation)
    @innovation = innovation
    mail to: innovation.user.email, subject: "Your innovation is no longer suspended"
  end

end
