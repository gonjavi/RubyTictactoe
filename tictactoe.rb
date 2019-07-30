class Game

    def initialize
        @WINNING_POSITIONS =
      [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    end

    def start
        @turns_played = 0
         @player = "x"
        @board = ["-", "-", "-", "-", "-", "-", "-", "-", "-"]
    end
    def show_board(board=@board)
        puts
        puts board[0..2].join(" ")
        puts board[3..5].join(" ")
        puts board[6..8].join(" ")
        puts
    end

    def play
       

        play_game = true
        while play_game
            show_board

        end
    end 

end

board = Game.new
board.play