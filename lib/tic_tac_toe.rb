def display_board(board)
    puts "--------------"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "---------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "---------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
        converted_input = user_input.to_i - 1
end

def move(board, position, token)
    board[position] = token
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == ""
        false
    else
        true
    end
end

def valid_move?(board, index)
    if index.between?(0, 8) && position_taken?(board, index) == false
        true
    elsif index.between?(0, 8) && position_taken?(board, index) == true
        false
    else
        false
    end
end

def turn(board)
    token = "X"
    puts "Enter a number 1-9:"
    user_input = gets
    converted_index = input_to_index(user_input)
    if valid_move?(board, converted_index)
        move(board, converted_index, token)
    else
        user_input = gets
    end
end

def turn_count(board)
    stripped_board = board.select{|i| i != " "}
    stripped_board.length
end

def current_player(board)
    if turn_count(board).even?
        "X"
    else
        "O"
    end
end

def won?(board)
    if board.all?{|i| i == " "}
        false
    end

    WIN_COMBINATIONS.each do |condi|
        winning_combi = []
        condi.each do |i|
            winning_combi << board[i]
        end
        if winning_combi.all?{|i| i == "X"}
            winning_combi
        elsif winning_combi.all?{|i| i == "O"}
            winning_combi
        elsif winning_combi.all?{|i| i != "X" || i != "O"} && full?(board)
            false
        end
    end
    return nil
end

def full?(board)
    if board.all?{|i| i == "X" || i == "O"}
        true
    elsif board.any?{|i| i == " "}
        false
    end
end

#WIN_COMBINATIONS
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]
