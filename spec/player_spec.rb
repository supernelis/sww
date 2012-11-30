require 'player'
describe Player do
  it "votes when asked for" do
    room = mock("room")
    player = Player.new("gijs", room)
    room.should_receive(:vote).with("harry")
    player.message_from_room("somebody", "Please vote who should be hanged: harry,gijs")
  end

  it "votes for random player" do
    room = mock("room")
    randomizer = mock("randomizer")
    randomizer.stubs(:random).and_return(1)
    player = Player.new("gijs", room, randomizer)
    room.should_receive(:vote).with("harry")
    player.message_from_room("somebody", "Please vote who should be hanged: harry,gijs")
  end
end

