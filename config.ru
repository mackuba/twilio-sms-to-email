Dir.mkdir('log') unless File.directory?('log')
log = File.new("log/sinatra.log", "a+")
log.sync = true
STDERR.reopen(log)

require File.expand_path('../server', __FILE__)

run Sinatra::Application
