def possibly_nil(value)
  Monads::Maybe.unit value
end

def many(*values)
  Monads::List.unit *values
end
