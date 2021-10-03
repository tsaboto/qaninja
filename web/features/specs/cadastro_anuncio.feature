Feature: Cadastro de anuncio
    Sendo usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meu esquipamento
    para que eu possa disponibilizalos para locação

    Background: Login
        * Login com "betao@gmail.com" e "pwd123"

    Scenario: Novo equipo

        Given que acesso o formulario de casdastro de anuncios
        And que eu tenha o seguinte equipamento:
            | thumb     | fender-sb.jpg  |
            | nome      | Fernder Strato |
            | categoria | Cordas         |
            | preco     | 200            |
        When submeto o cadastro desse item
        Then devo ver esse item  no meu Dashboard
    @temp
    Scenario Outline: Tentativa de cadastro de anúncios

        Given que acesso o formulario de casdastro de anuncios
        And que eu tenha o seguinte equipamento:
            | thumb     | <foto_input>      |
            | nome      | <nome_input>      |
            | categoria | <categoria_input> |
            | preco     | <preco_input>     |
        When submeto o cadastro desse item
        Then deve conter a mensagem de alerta: "<mensagem_output>"

        Examples:
            | foto_input    | nome_input        | categoria_input | preco_input | mensagem_output                      |
            |               | Violao nylon      | Cordas          | 150         | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                   | Outros          | 250         | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure   |                 | 100         | Informe a categoria                  |
            | trompete.jpg  | Trompete classico | Outros          |             | Informe o valor da diária            |
            | conga.jpg     | Conga             | Outros          | avd         | O valor da diária deve ser numérico! |
            | conga.jpg     | Conga             | Outros          | 12ed        | O valor da diária deve ser numérico! |