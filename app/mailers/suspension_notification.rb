class SuspensionNotification < ApplicationMailer
  def notification(innovation)
    @innovation = innovation
    mail to: innovation.user.email, subject: "Your innovation has been flagged for review"
  end
end
