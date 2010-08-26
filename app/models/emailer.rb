class Emailer < ActionMailer::Base
  
  def contact(recipient, mail, subject, message, sent_at = Time.now)
    @subject = subject
    @recipients = mail
    @from = 'kokirala@navionicsindia.com'
    @sent_on = sent_at
    @body["name"] = recipient
    @body["title"] = 'Pragmatic Store'
    @body["message"] = message
    @headers = {}
  end
end
