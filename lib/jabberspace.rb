require 'xmpp4r'
require 'xmpp4r/muc'


class JabberSpace
  include Jabber
  def initialize(jabber_id, password)
    @client = Client.new(JID::new(jabber_id))
    @client.connect
    @client.auth(password)
    @client.send(Presence.new.set_type(:available))
  end

  def on_invitation(&block)
    @client.add_message_callback do |m|
      yield(m.from)
    end
  end

  def create_room()
    Room.new(MUC::SimpleMUCClient.new(@client))
  end

  def send_message(to, message)
    msg = Message::new(to, message )
    msg.type=:chat
    @client.send(msg)
  end
end

class Room < Struct.new(:muc)
  def join(room, player)
    puts "joining #{room}"
    muc.on_message do | time, nic, text| 
      player.message_from_room(nic, text)
    end
    muc.join("#{room}/#{player.name}")
  end
  def say(message)
    puts "saying #{message}"
    muc.say(message)
  end
  def vote(name)
    say("I vote for #{name}")
  end
end


