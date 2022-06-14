# Desafio: Pedra, papel e tesoura
# Crie um método que seja capaz de receber duas jogadas, onde a primeira entrada é o movimento do jogador 1 e a segunda entrada é o movimento do jogador 2
# A saída deve ser uma string com a informação de qual dos jogadores foi o vencedor. Se houver empate, a saída deve ser uma string com a frase "Empate!"
# Extra: Quando a jogada do jogador 2 não é inserida, o método deve criar uma "máquina" que seja capaz de jogar contra o jogador 1

# a = {
#   'pedra': {
#     'tesoura': 'ganha',
#     'papel': 'perde', 
#     'pedra': 'empata'
#   }
# }
# a[jogada1][jogada2] 

class Jogo
  POSSIBLE_MOVES = %w[pedra papel tesoura]

  attr_reader :entrada1, :entrada2

  def initialize(entrada1, entrada2)
    @entrada1 = entrada1
    @entrada2 = entrada2
  end

  def rodada    
    if entrada1 == entrada2
      'Deu empate!'
    elsif entrada1 == 'papel'
      #  entrada2 == 'tesoura' ? "O jogador 2 venceu" : "O jogador 1 venceu"
      if entrada2 == 'tesoura'
        'O jogador 2 venceu'
      else
        'O jogador 1 venceu'
      end
    elsif entrada1 == 'tesoura'
      if entrada2 == 'papel'
        'O jogador 1 venceu'
      else
        'O jogador 2 venceu'
      end
    end
  end
end
