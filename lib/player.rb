class Player < Struct.new(:name, :room, :jabberspace)
  def message_from_room(nick, message)
    puts "#{nick} says:\t\t#{message}"
  end

  def join(room_id)
    room.join(room_id, self)
    room.say("Helloohooo")
  end

  def play(game_leader, delay = 5)
    jabberspace.on_invitation do |room_id|
      sleep(delay)
      join(room_id)
    end

    jabberspace.send_message game_leader, "I want to play"
  end

end

