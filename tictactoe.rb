class Game
    attr_accessor :board, :board_o, :board_x, :b

    def initialize
        #to intialize -start method and winning positions
        start
        @win_positions =
      [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    end

    def start
        #@turns_played = 0
         @player = "x"
         @board = ["-", "-", "-", "-", "-", "-", "-", "-", "-"]
        @board_o=0
        @board_x=0
        @b=0
    end
    def show_board
                      
        puts @board[0..2].join(" ")
        puts @board[3..5].join(" ") 
        puts @board[6..8].join(" ")
    end

    def play
        @play_game = true
        while @play_game
            
             puts "Tic Tac Toe"          
            show_board
            check_win
            check_draw
            turn
            change_player
        end
      
    end 
    
    def end_game        
        puts "The game has finished!!"
        exit
    end
    
    def check_win 
      
        #checking each position in the array x inside winnig positions
        @win_positions.each do |row|
            row.each do |cell|
                    if @board[cell]=="o"
                        @board_o +=1
                        if  @board_o==3
                            puts "the winner is player o"
                            end_game
                        end

                    elsif @board[cell]=="x"
                          
                        @board_x+=1
                        if  @board_x==3
                            puts "the winner is player x"
                        end_game
                        end
                    end
            end
            @board_x=0 
            @board_o=0
                
            
        end

    end
      
      # turno- poner x ó o
    def turn
        # @b recibe x o o y check board mira si no ha sido ocupada
        
            @b=gets.chomp
            if  @b =~ /\d/
                check_board
                 
             else
                puts "Please input a numerical position (1-9)"
                turn
             end
            
            put_on_board
      end
      def check_board
            @b=@b.to_i
         @b-=1
         if @board[@b] != "-"          
            puts "the number has been eelcted choose another number"
            turn
         end
      end

      def put_on_board
        if @player=="x"
            @board[@b]="x"

        elsif @player=="o"
            @board[@b]="o"
        end
      end

      def change_player
         @player== "x" ? @player="o" : @player="x"
      end

    def check_draw
        z=0
            @board.each do |x|
                if x!="-"
                    z+=1
                end
                if z==9
                    puts "the game is a draw"
                    end_game
                end

            end
    end
end

board = Game.new
board.play