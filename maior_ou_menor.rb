def welcome
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual seu nome?"
    name = gets
    puts "\n\n\n"
    puts "Começaremos o jogo para você, #{name}" 
end

def secret_number_draw
    puts "Escolhendo um numero secreto entre 0 e 200..."
    number_drawn = 175
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
        puts "✔ Acertou" 
        return true
    end 

    maior = secret_number > number_kicked
    puts maior ? "❌ Errou, o numero secreto é maior ! ⬆" : "❌ Errou, o numero secreto é menor ! ⬇"
    false
end 

def points_to_lose secret_number, number_kicked
    (secret_number - number_kicked).abs / 2.0
end

welcome
secret_number = secret_number_draw
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

puts "Você ganhou #{points_so_far} pontos"
