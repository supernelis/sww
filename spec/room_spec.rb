require 'room'

describe Room do
  let(:mock_muc) { mock("Jabber MUC", :on_message => nil, :join => nil) }
  let(:room) { Room.new(mock_muc) }

  describe "saying" do
    it "sends a message to the muc" do
      mock_muc.should_receive(:say).with("hello world")
      room.say("hello world")
    end
  end

  describe "joining a player in a room" do
    let(:player) { stub("Player", :name => 'harry') }

    it "registers on messages and joins the room on the muc" do
      mock_muc.should_receive(:join).with('the_room/harry')
      room.join('the_room', player)
    end

    it "delegates messages from the room to the player" do
      mock_muc.stub(:on_message).and_yield('timestamp', 'nicname', 'message')
      player.should_receive(:message_from_room).with('nicname', 'message')
      room.join('the_room', player)
    end
  end
end
