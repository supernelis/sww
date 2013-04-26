require 'player'
describe Player do
  let(:room) { mock("Room", :say => nil ) }
  let(:jabberspace) { mock('JabberSpace', :send_message => nil) }
  let(:player) { Player.new("harry", room, jabberspace) }

  describe "play" do
    it "asks the game leader to invite me" do
      jabberspace.should_receive(:on_invitation)
      jabberspace.should_receive(:send_message).with('game leader', 'I want to play')

      player.play('game leader', 0)
    end

    it "joins the room on invitation" do
      jabberspace.stub(:on_invitation).and_yield('the village')
      room.should_receive(:join).with('the village', player)
      player.play('game leader', 0)
    end
  end

  describe "joining a room" do
    let(:room) { mock('Room') }
    it "joins the room and greets others" do
      room.should_receive(:join).with('the village', player)
      room.should_receive(:say).with('Helloohooo')
      player.join('the village')
    end
  end
end

