#!/usr/bin/env ruby
$: << 'lib'
require 'rubygems'
require 'sww'

jabberspace = JabberSpace.on "rswwbot@awtest1.vm.bytemark.co.uk", "stoomboot"

player = Player.new("gijs", jabberspace.create_room, jabberspace)
player.play("sww@awtest1.vm.bytemark.co.uk")

$stdin.readline
