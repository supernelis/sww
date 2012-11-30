#!/usr/bin/env ruby
require 'rubygems'
require 'xmpp4r'
require 'xmpp4r/muc'

include Jabber

client = Client.new(JID::new("rswwbot@jabber.org"))
client.connect
client.auth("stoomboot")
client.send(Presence.new.set_type(:available))

muc = MUC::SimpleMUCClient.new(client)
muc.on_message do | time, nic, text| 
  puts "#{nic}|#{text}"
end

client.add_message_callback do |m|
  muc.join("#{m.from}/gijs")
end

msg = Message::new("sww@jabber.org", "I want to play")
msg.type=:chat
client.send(msg)

$stdin.readline
