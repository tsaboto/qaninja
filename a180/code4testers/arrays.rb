bandas = ["AC/DC", "Back Sabath", "Queen", "Os travessos"]


bandas.push("Nirvana")


bandas.delete("Queen")
#  puts bandas


# pagode = bandas.find { |item| item == 'Os travessos'} 
pagode = bandas.find { |item| item.include?  ('os')} 



puts pagode