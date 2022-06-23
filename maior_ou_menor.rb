def welcome
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual seu nome?"
    name = gets
    puts "\n\n\n"
    puts "Começaremos o jogo para você, #{name}" 
end

def ask_dificulty
    puts "\nQual o nível de dificuldade que deseja ? (1 facil, 5 dificil)"
    dificulty = gets.to_i
end

def secret_number_draw dificulty

    case dificulty
    when 1
        max = 30
    when 2
        max = 60
    when 3
        max = 100
    when 4
        max = 150
    else
        max = 200
    end

    puts "Escolhendo um numero secreto entre 0 e #{max}..."
    number_drawn = rand(max) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto ?"
    puts "\n\n\n"
    number_drawn
end

def ask_number kicks, attempt, attempt_limit
    puts "\ntentativa #{attempt} de #{attempt_limit} \n"
    puts "Chutes: #{kicks} "
    puts "\nEntre com o numero: "
    number_kicked = gets
    puts "\nSerá que acertou? 🤔🤔🤔 "
    number_kicked.to_i
end

def check_number number_kicked, secret_number
    acertou = number_kicked == secret_number

    if acertou
        puts "\n✔ Acertou" 
        return true
    end 

    maior = secret_number > number_kicked
    puts maior ? "❌ Errou, o numero secreto é maior ! ⬆" : "❌ Errou, o numero secreto é menor ! ⬇"
    false
end 

def points_to_lose secret_number, number_kicked
    (secret_number - number_kicked).abs / 2.0
end

def play dificulty
    secret_number = secret_number_draw dificulty
    points_so_far = 1000
    attempt_limit = 5
    kicks = []
    
    for attempt in 1..attempt_limit
    
        number_kicked = ask_number kicks, attempt, attempt_limit
        kicks << number_kicked
    
        points_so_far -= points_to_lose secret_number, number_kicked
    
        if check_number number_kicked, secret_number
            break
        end
    end
    
    puts "\nO numero secreto é #{secret_number}"
    puts "\nVocê ganhou #{points_so_far} pontos\n"
end

def play_again
   
    puts "\nDeseja jogar novamente?  (S/N)"
    
    i_want_play = gets.strip
    i_want_play.upcase === 'S'
end

welcome

while play_again
    dificulty = ask_dificulty
    play dificulty
end

