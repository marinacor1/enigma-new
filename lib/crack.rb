require 'pry'
require_relative 'encrypt'
require_relative 'encryption_tools'

class Crack
  include EncryptionTools

  def initialize(message, date)
    find_info_from_message(message, date)
    find_offset(date)
    find_message
  end

  def find_info_from_message(message, date)

  end

  def find_offset(date)

  end
end
