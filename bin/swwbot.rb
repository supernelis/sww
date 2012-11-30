#!/usr/bin/env ruby
$: << 'lib'
require 'rubygems'
require 'sww'



jabberspace = JabberSpace.new "rswwbot@jabber.org", "stoomboot"

player = Player.new("gijs", jabberspace.create_room, jabberspace)
player.play("sww@jabber.org")

$stdin.readline
