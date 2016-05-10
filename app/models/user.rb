class User < ActiveRecord::Base
  validates :nome, :idade, :endereco, presence: { message: 'Não pode ser vazio'}
  validates :nome, format: { with: /\A[a-zA-Z]+\z/,
    message: "Somente é permitido letras" }
  validates_numericality_of :idade , greater_than: 0, less_than: 130,
    message: "Somente é permitido NUMEROS MAIORES que 0 e NUMEROS MENORES que 130"
  validates :endereco, length: {maximum: 90,
    message: "Preencha neste formato: RUA TAL NUMERO"}
  validates_uniqueness_of :nome, message: "Já existe este Usuário"
end
