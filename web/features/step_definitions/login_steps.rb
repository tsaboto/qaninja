Given("que acesso a página principal") do
  @login_page.open
end

When("submeto minhas credenciais {string} e {string}") do |email, password|
  @login_page.with(email, password)
end
