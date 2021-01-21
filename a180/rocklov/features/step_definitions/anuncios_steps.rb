Given('que estou logado como {string} e {string}') do |email, password|
    @email = email

    login_page = LoginPage.new
    login_page.abre_pagina
    login_page.campo_email.set email
    login_page.campo_senha.set password
    login_page.botao_entrar
end

Given('que eu acesso o formulario de casdastro de anuncios') do
    click_button "Criar anúncio"
    # it is a checkpoint to make sure I'm on the right page
    expect(page).to have_css "#equipoForm"
end

Given('que eu tenha o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash
    
    MongoDB.new.remove_equipo(@anuncio[:nome], @email)

end
  
When('submeto o cadastro desse item') do
    
    thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

    find("#thumbnail input[type=file]", visible: false).set thumb
    
    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("input[placeholder^=Valor]").set @anuncio[:preco]

    click_button "Cadastrar"

end
  
Then('devo ver esse item  no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"

end
  