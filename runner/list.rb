require './config/load_config'
require './lib/ticket_client'

if ARGV[0] == "debug"
  ENV['DEBUG'] = true
end

LoadConfig.load

puts TicketClient.new.get_tickets
