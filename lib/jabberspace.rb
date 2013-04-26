require 'xmpp4r'
require 'xmpp4r/muc'
require 'room'

class JabberSpace
  include Jabber

  def initialize(client, password)
    @client = client
    @password = password
  end

  def self.on(jabber_id, password)
    client = Client.new(JID::new(jabber_id))
    jabberspace = new(client, password)
    jabberspace.connect
    return jabberspace
  end

  def connect
    @client.connect
    @client.auth(@password)
    @client.send(Presence.new.set_type(:available))
  end

  def on_invitation(&block)
    @client.add_message_callback do |m|
      yield(m.from) if m.from.to_s.start_with?('village')
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



