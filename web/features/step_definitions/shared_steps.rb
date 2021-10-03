Then("sou redirecionado para o Dashboard") do
  expect(@dash_page.on_dash?).to be true
end

Then("vejo a mensagem de alerta: {string}") do |expect_alert|
  #    alert = find(".alert-dark")
  expect(@alert.dark).to eql expect_alert
end
