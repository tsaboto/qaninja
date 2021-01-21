Feature: Cadastro de anuncio
    Sendo usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meu esquipamento
    para que eu possa disponibilizalos para locação

    Scenario: Novo equipo

        Given que estou logado como "betao@gmail.com" e "pwd123"
            And que eu acesso o formulario de casdastro de anuncios
            And que eu tenha o seguinte equipamento:
            | thumb     | fender-sb.jpg  |
            | nome      | Fernder Strato |
            | categoria | Cordas         |
            | preco     | 200            |

        When submeto o cadastro desse item

        Then devo ver esse item  no meu Dashboard