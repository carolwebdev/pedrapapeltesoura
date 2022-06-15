
class Jogo
  POSSIBLE_MOVES = %w[pedra papel tesoura]
  attr_accessor :entrada1, :entrada2

  def jogadas
    puts "
    -----------------PEDRA, PAPEL & TESOURA-----------------
    -----------------------JOGADOR 1------------------------
    - Digite Pedra, Papel ou Tesoura para fazer sua jogada -
    --------------------------------------------------------
    "
    @entrada1 = gets.chomp.downcase
    puts "
    -----------------PEDRA, PAPEL & TESOURA-----------------
    -----------------------JOGADOR 2------------------------
    - Digite Pedra, Papel ou Tesoura para fazer sua jogada -
    --------------------------------------------------------
    "
    @entrada2 = gets.chomp.downcase
  end

  def mostrar_jogadas
    case @entrada1
    when 'pedra'
      puts 'O jogador 1 escolheu Pedra'
    when 'papel'
      puts 'O jogador 1 escolheu Papel'
    when 'tesoura'
      puts 'O jogador 1 escolheu Tesoura'
    end
    case @entrada2
    when 'pedra'
      puts 'O jogador 2 escolheu Pedra'
    when 'papel'
      puts 'O jogador 2 escolheu Papel'
    when 'tesoura'
      puts 'O jogador 2 escolheu Tesoura'
    end
  end

  def verificacao
   (POSSIBLE_MOVES.include?(@entrada1)) && (POSSIBLE_MOVES.include?(@entrada2))
  end

  def rodada
    if !verificacao
    puts 'Entrada inválida'
    exit
    end

    hash = {
      'pedra': {
        'tesoura': 'O jogador 1 ganhou.',
        'papel': 'O jogador 2 ganhou.',
        'pedra': 'Houve empate.'
      },
      'papel': {
        'tesoura': 'O jogador 2 ganhou.',
        'papel': 'Houve empate.',
        'pedra': 'O jogador 1 ganhou.'
      },
      'tesoura': {
        'tesoura': 'Houve empate.',
        'papel': 'O jogador 1 ganhou.',
        'pedra': 'O jogador 2 ganhou.'
      }
    }
    puts '####'
    puts hash[@entrada1.to_sym][@entrada2.to_sym]
    puts '####'
  end
end

jogada = Jogo.new()
jogada.jogadas
jogada.mostrar_jogadas
jogada.rodada