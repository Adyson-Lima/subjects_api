puts 'Gerando subjects...'

5.times do |i|
  Subject.create(
    name: ["matematica", "fisica"].sample ,
    detail: ["assunto 1","assunto2"].sample
    )
end

puts 'subjects gerados com sucesso!'
