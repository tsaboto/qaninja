
# nome = "Fernando"
# idade = 15

# if (idade >= 18)
#     puts nome + ", você já pode tirar sua carteira de motorista"
    
# elsif(idade >=7)
#     puts nome + ", você deve continuar andando de bicilceta" 

# else
#     puts nome + ", você é muito jovem continue andando de motoquinha"
# end


puts "Qual seu nome?"

nome = gets.chomp
puts "Qual sua idade"
idade = gets.chomp.to_i


if (idade >= 18)
    # puts nome + ", você tem " + idade.to_s + " anos e já pode tirar sua carteira de motorista"
    puts "#{nome}, você tem #{idade} anos e já pode tirar sua carteira de habilitação. "
    
elsif(idade >=7)
    # puts nome + ", você tem " + idade.to_s + " anos e deve continuar andando de bicilceta" 
    puts "#{nome}, você tem #{idade} anos e deve continuar andando de bicilceta" 

else
    puts  "#{nome}, você tem #{idade} anos e ainda é muito jovem, continue andando de motoquinha"
end







