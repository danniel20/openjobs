namespace :dev do

  desc "Configurando ambiente de desenvolvimento"
  task setup: :environment do

    show_spinner("APAGANDO BD..."){ %x(bin/rails db:drop) }
    show_spinner("CRIANDO BD..."){ %x(bin/rails db:create) }
    show_spinner("MIGRANDO BD..."){ %x(bin/rails db:migrate) }

    show_spinner("Criando Usuário..."){ %x(bin/rails dev:generate_users) }
    show_spinner("Criando Empresa..."){ %x(bin/rails dev:generate_company) }
    show_spinner("Criando Vagas..."){ %x(bin/rails dev:generate_positions) }
  end

  desc "Cria Usuários Fake"
  task generate_users: :environment do
    User.create!(email: "teste@teste.com", password: "123456")
    User.create!(email: "teste2@teste.com", password: "123456")
  end

  desc "Cria Empresa"
  task generate_company: :environment do
    c1 = Company.new(name: Faker::Company.name, url: Faker::Internet.url , user_id: User.first.id)
    c1.logo.attach(io: URI.open('https://robohash.org/teste1'), filename: "teste1.png")
    c1.save!

    c2 = Company.new(name: Faker::Company.name, url: Faker::Internet.url , user_id: User.last.id)
    c2.logo.attach(io: URI.open('https://robohash.org/teste2'), filename: "teste2.png")
    c2.save!
  end

  desc "Cria Vagas Fake"
  task generate_positions: :environment do
    10.times do |i|
      Position.create!(
          name: "Vaga #{i+1}",
          career: [:developer, :business_inteligence, :information_technology, :design, :product,:technology, :other].sample,
          contract: [:clt, :pj, :match].sample,
          remote: [false, true].sample,
          city: 'Fortaleza',
          state: Brazil.states.keys[5],
          summary: Faker::Lorem.paragraph,
          company: Company.first
      )
    end

    10.times do |i|
      Position.create!(
          name: "Vaga #{i+11}",
          career: [:developer, :business_inteligence, :information_technology, :design, :product,:technology, :other].sample,
          contract: [:clt, :pj, :match].sample,
          remote: [false, true].sample,
          city: 'São Paulo',
          state: Brazil.states.keys[24],
          summary: Faker::Lorem.paragraph,
          company: Company.last
      )
    end

  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end)
  end

end
