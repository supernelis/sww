require 'player'
describe Player do
  it "votes when asked for" do
    room = mock("room")
    player = Player.new("gijs", room)
    room.should_receive(:vote).with("harry")
    player.message_from_room("somebody", "Please vote who should be hanged: harry,gijs")
  end

end

