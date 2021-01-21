Feature: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @cadastro
    Scenario: Fazer cadastro

        Given que acesso a página de cadastro
        When submeto o seguinte formulário de cadastro:
            | nome           | email           | senha    |
            | Tatiane Saboto | teste@gmail.com | teste123 |

        Then sou redirecionado para o Dashboard

    Scenario Outline: Tentativa de cadastro
        Given que acesso a página de cadastro
        When submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Then vejo a mensagem de alerta: "<mensagem_output>"

        Examples:
            | nome_input     | email_input     | senha_input | mensagem_output                  |
            |                | teste@gmail.com | teste123    | Oops. Informe seu nome completo! |
            | Tatiane Saboto |                 | teste123    | Oops. Informe um email válido!   |
            | Tatiane Saboto | teste&gmail.com | teste123    | Oops. Informe um email válido!   |
            | Tatiane Saboto | teste%gmail.com | teste123    | Oops. Informe um email válido!   |
            | Tatiane Saboto | teste@gmail.com |             | Oops. Informe sua senha secreta! |


