# Twilio SMS-to-email service

This project is a small Ruby server that receives incoming SMS callbacks from Twilio and forwards the contents to a specified email address.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Installation

* deploy it to a web server
* pass the `MAIL_FROM` and `MAIL_TO` environment variables to the script somehow (e.g. in server start scripts or nginx config, that depends on your configuration)
* set the incoming SMS URL in Twilio configuration to http://someserver/somepath/sms (the URL to this script once you've deployed it)
* set EMAIL_MODE to `sendgrid` if you wish to use SendGrid for emails.  The script will then expect the `SENDGRID_USERNAME` and `SENDGRID_PASSWORD` environment variables to be configured. (These are set automatically on Heroku if you use the Heroku button above.)  Otherwise, the script will default to using sendmail on your server.

## Credits

Created by [Kuba Suder](http://psionides.eu), licensed under WTFPL License.
