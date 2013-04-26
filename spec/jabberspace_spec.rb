require 'jabberspace'

describe JabberSpace do
  let(:mock_client) { mock("Jabber Client", :connect => nil, :auth => nil, :send => nil) }
  let(:jabberspace) { JabberSpace.new(mock_client, 'secret') }

  describe "connect" do
    include Jabber
    it "connects, authenticate an sets available" do
      mock_client.should_receive(:connect)
      mock_client.should_receive(:auth)
      mock_client.should_receive(:send).with(Jabber::Presence.new.set_type(:available))
      jabberspace.connect
    end
  end
end
