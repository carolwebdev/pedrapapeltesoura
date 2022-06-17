# frozen_string_literal: true

require 'rspec'
require 'spec_helper'
require 'pry'

RSpec.describe Jogo do
  describe '#rodada' do
    context 'when entrada1 == entrada2' do
      it 'returns the draw message' do
        expect(Jogo.new('papel', 'papel').rodada).to eq('Deu empate!')
      end
    end

    context 'when entrada1 é papel e entrada2 é tesoura' do
      it 'returns the draw message' do
        expect(Jogo.new('papel', 'tesoura').rodada).to eq('O jogador 2 venceu.')
      end
    end

    context 'when entrada1 é papel e entrada2 é pedra' do
      it 'returns the draw message' do
        expect(Jogo.new('papel', 'pedra').rodada).to eq('O jogador 1 venceu.')
      end
    end

    context 'when entrada1 é tesoura' do 
      context 'and when entrada2 é papel' do 
        it 'returns player1 wins message' do
          expect(Jogo.new('tesoura', 'papel').rodada).to eq('O jogador 1 venceu.')
        end
      end

      context 'and when entrada2 é pedra' do 
        it 'returns player2 wins message' do
          expect(Jogo.new('tesoura', 'pedra').rodada).to eq('O jogador 2 venceu.')
        end
      end
    end

    context 'when entrada1 é pedra' do 
      context 'and when entrada2 é papel' do 
        it 'returns player2 wins message' do
          expect(Jogo.new('pedra', 'papel').rodada).to eq('O jogador 2 venceu.')
        end
      end

      context 'and when entrada2 é tesoura' do 
        it 'returns player1 wins message' do
          expect(Jogo.new('pedra', 'tesoura').rodada).to eq('O jogador 1 venceu.')
        end
      end
    end

    context 'and when entrada inválida' do 
      it 'returns entrada1 inválida' do
        expect(Jogo.new('opps', 'tesoura').rodada).to eq('Entrada inválida!')
      end
      it 'returns entrada2 inválida' do
        expect(Jogo.new('pedra', ' ').rodada).to eq('Entrada inválida!')
      end
      it 'returns entrada1 e entrada2 inválidas' do
        expect(Jogo.new('0', '1').rodada).to eq('Entrada inválida!')
      end
    end
  end
end