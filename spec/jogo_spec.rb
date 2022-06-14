# frozen_string_literal: true

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
        expect(Jogo.new('papel', 'tesoura').rodada).to eq('O jogador 2 venceu')
      end
    end

    context 'when entrada1 é papel e entrada2 é pedra' do
      it 'returns the draw message' do
        expect(Jogo.new('papel', 'pedra').rodada).to eq('O jogador 1 venceu')
      end
    end

    context 'when entrada1 é tesoura' do 
      context 'and when entrada2 é papel' do 
        it 'returns player1 wins message' do
          expect(Jogo.new('tesoura', 'papel').rodada).to eq('O jogador 1 venceu')
        end
      end

      context 'and when entrada2 é pedra' do 
        it 'returns player2 wins message' do
          expect(Jogo.new('tesoura', 'pedra').rodada).to eq('O jogador 2 venceu')
        end
      end
    end
  end
end
