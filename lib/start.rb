class Start

  attr_reader :input

  def initialize(input)
    @input = input
  end

  def start(turn)
    turn_count = 1

    if @input != 'GO'
      p "Please rerun the start file and type 'GO' exactly to start the game."

      exit

    elsif @input == 'GO'

      while turn_count < 1000001 && turn.player1.has_lost? == false && turn.player2.has_lost? == false
        if turn_count == 1000000

          p "---- DRAW ----"

        elsif  turn.player1.has_lost? == true

          p "*~*~*~* #{turn.player2.name} has won the game! *~*~*~*"

        elsif turn.player2.has_lost? == true

          p "*~*~*~* #{turn.player1.name} has won the game! *~*~*~*"

        else

          if turn.type == :basic

            p "Turn #{turn_count}: #{turn.winner.name} won 2 cards"

            turn.pile_cards
            turn.award_spoils(turn.winner)
            turn_count += 1

          elsif turn.type == :war

            p "Turn #{turn_count}: WAR - #{turn.winner.name} won 6 cards"

            turn.pile_cards
            turn.award_spoils(turn.winner)
            turn_count += 1

          elsif turn.type == :mutually_assured_destruction

            p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"

            turn.pile_cards
            turn_count += 1

          end
        end
      end

    end

  end

end
