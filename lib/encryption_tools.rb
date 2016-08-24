module EncryptionTools

  def character_map
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
    'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
    'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9', ' ', '.', ',']
  end

  def rotation_as
    [0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40]
  end

  def rotation_bs
    [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41]
  end

  def rotation_cs
    [2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42]
  end

  def rotation_ds
    [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43]
  end

  def addOffsetsAndKey(offsets, key)
    values = Hash.new
    values['a'] = offsets[0].to_i + (key[0] + key[1]).to_i
    values['b'] = offsets[0].to_i + (key[1] + key[2]).to_i
    values['c'] = offsets[0].to_i + (key[2] + key[3]).to_i
    values['d'] = offsets[0].to_i + (key[4] + key[-1]).to_i
    values
  end

end
