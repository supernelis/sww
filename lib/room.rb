class Room < Struct.new(:muc)
  def join(room, player)
    muc.on_message do | time, nic, text| 
      player.message_from_room(nic, text)
    end
    muc.join("#{room}/#{player.name}")
  end
  def say(message)
    muc.say(message)
  end
end

