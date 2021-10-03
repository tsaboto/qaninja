
Feature: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Scenario: Login do usuário

        Given que acesso a página principal
        When submeto minhas credenciais "tsaboto@gmail.com" e "pwd123"
        Then sou redirecionado para o Dashboard

    Scenario Outline: Tentativa de login
        Given que acesso a página principal
        When submeto minhas credenciais "<email_input>" e "<senha_input>"

        Then vejo a mensagem de alerta: "<mensagem_output>"

        Examples:

            | email_input       | senha_input | mensagem_output                  |
            | tsaboto@gmail.com | abc123      | Usuário e/ou senha inválidos.    |
            | teste01@404.com   | ts123       | Usuário e/ou senha inválidos.    |
            | tsaboto$gmail.com | ts223       | Oops. Informe um email válido!   |
            |                   | ts123       | Oops. Informe um email válido!   |
            | tsaboto@gmil.com  |             | Oops. Informe sua senha secreta! |
