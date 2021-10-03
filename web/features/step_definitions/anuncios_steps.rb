Given("Login com {string} e {string}") do |email, password|
  @email = email

  @login_page.open
  @login_page.with(email, password)
end

Given("que acesso o formulario de casdastro de anuncios") do
  @dash_page.goto_equipo_form
end

Given("que eu tenha o seguinte equipamento:") do |table|
  @anuncio = table.rows_hash

  MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end

When("submeto o cadastro desse item") do
  @equipos_page.create(@anuncio)
end

Then("devo ver esse item  no meu Dashboard") do
  expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
  expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Then("deve conter a mensagem de alerta: {string}") do |expect_alert|
  expect(@alert.dark).to have_text expect_alert
end
