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
        @oard_o=0
        @board_x=0
        @b=0
    end
    def show_board(board = @board)
        puts board[0..2].join(" ")
        puts board[3..5].join(" ")
        puts board[6..8].join(" ")
        
    end

    def play
        @play_game = true
        while @play_game
            puts "press the letter (q) if you want to exit at any time"
            show_board
           # check_win
            turn
            change_player


        end
      end_game
    end 
    
    def end_game        
        puts "The game has finished!!"
        exit
    end
    
    def abort_game
        x=gets.chomp
        if x== "q"
            print "press y to comfirm"
            x=gets.chomp
            exit if x== "y"
                 

        end
    end
    
      def check_win 
        #checking each position in the array x inside winnig positions
        @win_positions.each do |x|
            x.each do |y|
                    if @board[y]=="o"
                        @board_x=0 
                        board_o=0 
                        board_o +=1
                        if  @board_o==3
                            print "the winner is player o"
                        end

                    elsif @board[y]=="x"
                        @board_o=0    
                        @board_x+=1
                        if  @board_x==3
                            print "the winner is player x"
                        end
                    end
            end
            
                
            
        end

      end
      # turno- poner x ó o
      def turn
        # @b recibe x o o y check board mira si no ha sido ocupada
        @b=gets.chomp.to_i
        
        check_board
        put_on_board
        check_draw
      end

      def check_board
         
         @b-=1
         while @board[@b]!="-"
            
            print "the position has been elected, choose another one"
            @b=gets.chomp
            @b-=1
            @board[@b]="x"
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
                    puts "the game is draw"
                    end_game
                end

            end
      end
end

board = Game.new
board.play