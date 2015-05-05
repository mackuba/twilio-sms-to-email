# Twilio SMS-to-email service

This project is a small Ruby server that receives incoming SMS callbacks from Twilio and forwards the contents to a specified email address.

## Installation

* deploy it to a web server
* pass the `MAIL_FROM` and `NUMBER_TO_EMAIL_MAP` environment variables to the script somehow (e.g. in server start scripts or nginx config, that depends on your configuration)
	* `MAIL_FROM` is the email address that the script should send emails from
	* `MAIL_TO` is the email address that the script should send emails to - this takes precendence over `NUMBER_TO_EMAIL_MAP`
	* `NUMBER_TO_EMAIL_MAP` is a hash of phone numbers (in Twilio's international format: `+12125556789`) to email addresses - i.e. `{'+12125556789' => 'test@domain.com', '+13334445555' => 'test@domain.com'}` - if `MAIL_TO` is set, that will be used instead
* set the incoming SMS URL in Twilio configuration to http://someserver/somepath/sms (the URL to this script once you've deployed it)
* if you wish to use SendGrid for emails, set `EMAIL_MODE` to `sendgrid`.  The script will then expect the `SENDGRID_USERNAME`, `SENDGRID_PASSWORD` and `SENDGRID_DOMAIN` environment variables to be configured (these are set automatically on Heroku if you use the deploy button below). Otherwise, the script will default to using sendmail on your server.

## Deployment to Heroku

If you want to deploy the webapp to your Heroku account, simply click the button below:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Credits

Created by [Kuba Suder](http://mackuba.eu), licensed under VSPL ([Very Simple Public License](https://github.com/mackuba/twilio-sms-to-email/blob/master/VSPL-LICENSE.txt)).
