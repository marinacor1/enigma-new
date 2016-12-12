require 'pry'
require_relative 'encrypt'
require_relative 'encryption_tools'

class Crack
  include EncryptionTools

  def initialize(message, date)
    find_info_from_message(message, date)
    find_offsets(date)
  end

  def find_info_from_message(message, date)
    first_index = message.length - 7
    last_index = message.length - 1
    last_letters = message[first_index, last_index]
    convert(date, last_letters)
  end

  def find_offsets(date)
    new_date = date.strftime('%d%m%y').to_i
    squared_date = (new_date * new_date).to_s
    @offsets = [squared_date[-4], squared_date[-3], squared_date[-2], squared_date[-1]].join
  end

  def convert(date, last_letters)
    converted_letters = last_letters.chars.map do |letter|
      character_map.index(letter)
    end
    find_message(converted_letters)
  end

  def find_message(converted_letters)
    #converted_letters
    #@offsets

  end


end
