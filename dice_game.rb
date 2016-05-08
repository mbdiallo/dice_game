class Game
  #Remove dices having 1 and 6 as result
	def remove(player_a, player_b, player_c, player_d)
		player_a.each do |k, v|
		  player_a.delete_if {|k, v| v == 6}
		  player_a.delete_if {|k, v| v == 1}
		end

		player_b.each do |k, v|
		  player_b.delete_if {|k, v| v == 6}
		  player_b.delete_if {|k, v| v == 1}
		end

		player_c.each do |k, v|
		  player_c.delete_if {|k, v| v == 6}
      player_c.delete_if {|k, v| v == 1}
		end

		player_d.each do |k, v|
		  player_d.delete_if {|k, v| v == 6}
		 player_d.delete_if {|k, v| v == 1}
		end
	end

	def display(player_a, player_b, player_c, player_d)
		print 'Player A: '
		i = 1
		player_a.each do |key, value|
		  if i < player_a.size
				print value, ', '
		  else
				print value
		  end
  			i +=1
		end

		print "\n", 'Player B: '

		i = 1
		player_b.each do |key, value|
		  if i < player_b.size
				print value, ', '
		  else
				print value
		  end
  			i +=1
		end

		print "\n", 'Player C: '

		i = 1
		player_c.each do |key, value|
	    if i < player_c.size
				print value, ', '
	    else
				print value
	    end
			i +=1
		end

		print "\n", 'Player D: '

		i = 1
		player_d.each do |key, value|
	    if i < player_d.size
				print value, ', '
	    else
				print value
	    end
			i +=1
		end

		puts ' '
	end

 	#move dice to  player on the right
	def move_dice(temp_a, temp_b, temp_c, temp_d, player_a, player_b, player_c, player_d)
		if temp_d.size > 0
			temp_d.each do |k, v|
				player_a.store(k,v)
			end
		end

		if temp_a.size > 0
			temp_a.each do |k, v|
				player_b.store(k,v)
			end
		end

		if temp_b.size > 0
			temp_b.each do |k, v|
				player_c.store(k,v)
			end
		end

		if temp_c.size > 0
			temp_c.each do |k, v|
				player_d.store(k,v)
			end
		end

		puts ' ', 'After dice moved/removed'
		puts '-------------------------'
		display(player_a, player_b, player_c, player_d)
	end

	#store dice with 1 on top temporarily in a container and clean after every round
  def store(player_a, player_b, player_c, player_d, temp_a, temp_b, temp_c, temp_d)
		temp_a.clear
		temp_b.clear
		temp_c.clear
		temp_d.clear

		player_a.each do |key, value|
		  if value == 1
	      temp_a.store(key,value)
		   end
		end

		player_b.each do |key, value|
		  if value == 1
		     temp_b.store(key,value)
		  end
		end

		player_c.each do |key, value|
		  if value == 1
		    temp_c.store(key,value)
		  end
		end

		player_d.each do |key, value|
		  if value == 1
	      temp_d.store(key,value)
		  end
		end

		remove(player_a, player_b, player_c, player_d)
		move_dice(temp_a, temp_b, temp_c, temp_d, player_a, player_b, player_c, player_d)
	end
end

	#declare each player as an empty hash
	player_a = Hash.new {}
	player_b = Hash.new {}
	player_c = Hash.new {}
	player_d = Hash.new {}

	#create temp for each player to store the key value pair
	temp_a = Hash.new
	temp_b = Hash.new
	temp_c = Hash.new
	temp_d = Hash.new


	#Initial game
	round = 1
	object = Game.new

	if round == 1
		print 'Round #', round, "\n"
		puts ' --------'
		puts 'After dice rolled'
		puts '-----------------'
		#For round 1 of each player
		player_a = {player_a_dice_1: rand(1..6), player_a_dice_2: rand(1..6),
		  player_a_dice_3: rand(1..6), player_a_dice_4: rand(1..6),
		  player_a_dice_5: rand(1..6), player_a_dice_6: rand(1..6)}

		#Player B
		player_b = {player_b_dice_1: rand(1..6), player_b_dice_2: rand(1..6),
		  player_b_dice_3: rand(1..6), player_b_dice_4: rand(1..6),
		  player_b_dice_5: rand(1..6), player_b_dice_6: rand(1..6)}

		#Player C
		player_c = {player_c_dice_1: rand(1..6), player_c_dice_2: rand(1..6),
		  player_c_dice_3: rand(1..6), player_c_dice_4: rand(1..6),
		  player_c_dice_5: rand(1..6), player_c_dice_6: rand(1..6)}

		#Player D
		player_d = {player_d_dice_1: rand(1..6), player_d_dice_2: rand(1..6),
		  player_d_dice_3: rand(1..6), player_d_dice_4: rand(1..6),
		  player_d_dice_5: rand(1..6), player_d_dice_6: rand(1..6)}

		object.display(player_a, player_b, player_c, player_d)
		object.store(player_a, player_b, player_c, player_d, temp_a, temp_b, temp_c, temp_d)
		puts ' '
	end


  until player_a.size == 0 || player_b.size == 0 || player_c.size == 0 || player_d.size == 0 do
		round += 1
		print  "\n", 'Round ', round, "\n"
		puts '----------', ' '

		#Roll dice again for a new round
		player_a.each {|k, v| player_a[k] = rand(1..6) }
		player_b.each {|k, v| player_b[k] = rand(1..6) }
		player_c.each {|k, v| player_c[k] = rand(1..6) }
		player_d.each {|k, v| player_d[k] = rand(1..6) }
		puts '', 'After dice rolled'
		puts '-----------------', ' '
		object.display(player_a, player_b, player_c, player_d)
		object.store(player_a, player_b, player_c, player_d, temp_a, temp_b, temp_c, temp_d)

	  #Display Winner (s)
		if player_a.size == 0 && player_b.size == 0 && player_c.size == 0 && player_d.size == 0
			puts 'The winners are: ', 'Player A, Player B, Player C, Player D'
			elsif player_a.size == 0 && player_b.size == 0
			puts 'The winners are: ', 'Player A, Player B'
			elsif player_a.size == 0 && player_c.size == 0
			puts 'The winners are: ', 'Player A, Player C'
			elsif player_a.size == 0 && player_d.size == 0
			puts 'The winners are: ', 'Player A, Player D'
			elsif player_b.size == 0 && player_c.size == 0
			puts 'The winners are: ', 'Player B, Player C'
			elsif player_b.size == 0 && player_d.size == 0
			puts 'The winners are: ', 'Player B, Player D'
			elsif player_c.size == 0 && player_d.size == 0
			puts 'The winners are: ', 'Player C, Player D'
			elsif player_a.size == 0
			puts 'The winner is: ', 'Player A'
			elsif player_b.size == 0
			puts 'TThe winner is: ', 'Player B'
			elsif player_c.size == 0
			puts 'The winner is: ', 'Player C'
			elsif player_d.size == 0
			puts 'TThe winner is: ', 'Player D'
		end
end
