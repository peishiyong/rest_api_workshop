require './config/load_config'
require './lib/ticket_client'

LoadConfig.load

puts TicketClient.new.create_ticket
