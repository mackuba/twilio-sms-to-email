require 'rubygems'
require 'bundler'

require 'etc'
require 'socket'

Bundler.require

Pony.options = {
  via: :sendmail,
  via_options: { arguments: '-i' }
}

def send_mail(from, to, body)
  subject = "Twilio SMS gateway: new SMS to #{to}"
  content = "Hi,\n\nTwilio SMS gateway at #{Socket.gethostname} has received this SMS to #{to}:\n\n#{body}\n"

  $stderr.puts("#{from} -> #{to}: #{body.inspect}")

  Pony.mail(from: settings.mail_from, to: settings.mail_to, subject: subject, body: content)
end

configure do
  login = Etc.getlogin
  hostname = Socket.gethostname

  set :port, ENV['PORT'] || 3000
  set :mail_from, ENV['MAIL_FROM'] || "root@#{hostname}"
  set :mail_to, ENV['MAIL_TO'] || "#{login}@#{hostname}"
end

post '/sms' do
  from = params['From']
  body = params['Body']
  to = params['To'] || "unknown"

  if from && body
    send_mail(from, to, body)
  end

  "<Response></Response>"
end
