require "pry"
require "pry-nav"

class Jogo
  JOGADAS_POSSIVEIS = %w[pedra papel tesoura]
  attr_accessor :entrada1, :entrada2, :escolha, :entrada_do_computador
  def menu
    loop do
      break if @escolha == 1 || @escolha == 2
      begin    
        puts "
        -----------------PEDRA, PAPEL & TESOURA-----------------
        Você deseja jogar contra:
        1 - Outro jogador
        2 - O computador
        "
        @escolha = gets.chomp.to_i
        if @escolha == 1
          jogada = Jogo.new
          jogada.jogar_contra_usuario
          jogada.mostrar_jogadas
          jogada.rodada
        elsif @escolha == 2
          jogada = Jogo.new
          jogada.jogar_contra_computador
          jogada.mostrar_jogadas
          jogada.rodada
        else
          puts 'Escolha uma opção válida'
          jogada = Jogo.new
          jogada.menu
        end
      end
    end
  end

  def jogar_contra_usuario
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

  def jogar_contra_computador
    puts "
    -----------------PEDRA, PAPEL & TESOURA-----------------
    -----------------------JOGADOR 1------------------------
    - Digite Pedra, Papel ou Tesoura para fazer sua jogada -
    --------------------------------------------------------
    "
    @entrada1 = gets.chomp.downcase
    @entrada_do_computador = JOGADAS_POSSIVEIS[rand(JOGADAS_POSSIVEIS.length)]
    puts "\nO computador escolheu: #{@entrada_do_computador}."
    @entrada2 = @entrada_do_computador
  end

  def mostrar_jogadas
    case @entrada1
    when 'pedra'
      puts "\nO jogador 1 escolheu Pedra."
    when 'papel'
      puts "\nO jogador 1 escolheu Papel."
    when 'tesoura'
      puts "\nO jogador 1 escolheu Tesoura."
    end
    case @entrada2
    when 'pedra'
      puts "\nO jogador 2 escolheu Pedra."
    when 'papel'
      puts "\nO jogador 2 escolheu Papel."
    when 'tesoura'
      puts "\nO jogador 2 escolheu Tesoura."
    end
  end

  def verificacao
   (JOGADAS_POSSIVEIS.include?(@entrada1)) && (JOGADAS_POSSIVEIS.include?(@entrada2))
  end

  def rodada
    if !verificacao
    puts 'Entrada inválida'
    exit
    end
    
    resultado = {
      'pedra': {
        'tesoura': 'O jogador 1 venceu.',
        'papel': 'O jogador 2 venceu.',
        'pedra': 'Deu empate!.'
      },
      'papel': {
        'tesoura': 'O jogador 2 venceu.',
        'papel': 'Deu empate!',
        'pedra': 'O jogador 1 venceu.'
      },
      'tesoura': {
        'tesoura': 'Deu empate!',
        'papel': 'O jogador 1 venceu.',
        'pedra': 'O jogador 2 venceu.'
      }
    }
    puts "\n####"
    puts resultado[@entrada1.to_sym][@entrada2.to_sym]
    puts '####'
  end
end

jogada = Jogo.new
jogada.menu