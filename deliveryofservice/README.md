# Delivery of Service MVP APP

Projeto APP Delivery of Service

## Desenvolvido por Guilherme Rey Simioni e Renan Joly


Assita o Video abaixo para verificar todo o fluxo do aplicativo:

- [Ver o funcionamento desse MVP](https://www.youtube.com/watch?v=-G0IQOYTYlw&feature=youtu.be)


# Fluxo das telas

Para a criação do ícone inicial do aplicativo, foi utilizado a biblioteca abaixo.
- flutter_launcher_icons: "^0.7.0"

O aplicativo Conterá 5 telas conforme solicitado pela faculdade. Vamos a elas:

## Tela de login

Padrão como a grande maioria, campos para digitar as credenciais e botões de login, cadastrar(registrar) e recuperar senha. A autenticação está encarregada da API da Firebase que foi configurado para o uso desse aplicativo mediante ao nosso projeto, assim como a redefinição de senha. 
API Firebase utilizadas:
- firebase_auth: ^0.18.0+1
- firebase_core: ^0.5.0

Para não ficar extenso o documento iremos apresentar somente as telas sem todos os snackbars configurados de erros. 

![image](https://user-images.githubusercontent.com/32063862/93276936-5ec03a80-f797-11ea-95d7-f177a4590e0c.png)

Conforme dito, tela padrão com dois TextForm sendo para o primeiro de E-mail com Input correto para a digitação de e-mail e o de senha com obscureText verdadeiro para não aparecer o texto digitado na tela. 
Ao clicar no botão Login ele fará a autenticação do usuário, onde com as credenciais corretas levará para a tela principal e caso esteja em branco ou erradas as informações serão exibidas um snack bar alertando. 
O botão registrar ao ser clicado fará a verificação dos dados digitados nos TextForm, onde o e-mail precisará ser válido e a senha, segundo o Firebase, precisará ser de no mínimo 6 caracteres, caso as informações estejam inválidas será exibido outro snack bar avisando sobre a falha e caso os dados estejam certos, será criado um novo usuário no banco de dados do Firebase e efetuado o login.
O botão de recuperar senha levará o usuário para a página correspondente a ela. 

## Tela de recuperar senha

![image](https://user-images.githubusercontent.com/32063862/93277052-ab0b7a80-f797-11ea-8333-da5b855968a2.png) ![image](https://user-images.githubusercontent.com/32063862/93277077-b8286980-f797-11ea-907f-e3038050c183.png)

O layout é simples, para interação do usuário conterá apenas um TextForm e dois botão. 
Ao clicar no botão ele verificará se o campo está vazio e caso o usuário digite um e-mail cadastrado, será encaminhado um link com o passo a passo para a redefinição da senha desse correio informado e printará na tela um avio de sucesso como na imagem de exemplo, caso o espaço esteja em branco será emitido um alertDialog alertando sobre o erro. 
E clicando na seta localizada no appbar o usuário será redirecionado para a tela de Login novamente. 

## Página principal
![image](https://user-images.githubusercontent.com/32063862/93277131-df7f3680-f797-11ea-9424-6e9f0137f6f0.png) ![image](https://user-images.githubusercontent.com/32063862/93277141-e8700800-f797-11ea-943e-2701c00da65a.png)

A tela principal traduz um pouco a ideia proposta em nosso projeto, sobre uma nova forma de exibição de profissionais principalmente os autônomos, onde nela conterá informações apresentadas em um Card, onde identificará a categoria de cada profissional através dos ícones, o nome dele, a foto e uma breve descrição sobre seus serviços.
As imagens e ícones são carregados via internet. 
Conterá um botão de favoritos, onde ao clicado o Card selecionado será exibido também na página de favoritos.
Para a realização desse processo foi utilizado a biblioteca do provider abaixo: 
- provider: ^3.1.0+1

E no app bar haverá o logo do nosso projeto com um botão de menu que abrirá menu lateral. 

![image](https://user-images.githubusercontent.com/32063862/93277157-fcb40500-f797-11ea-8a93-70cbfae15973.png)

O menu lateral é básico, contém o nome do projeto em primeiro lugar e em seguida os links para acessar as respectivas páginas e para se deslogar do aplicativo. 

## Página principal

![image](https://user-images.githubusercontent.com/32063862/93277188-17867980-f798-11ea-90cc-c2455a39eab7.png) ![image](https://user-images.githubusercontent.com/32063862/93277199-1fdeb480-f798-11ea-9d9d-a0af95a1bb96.png)

A tela do perfil do usuário terá a finalidade de somente mostrar seus dados, onde a busca é feita logo quando ele faz o login e armazenadas em uma variável para a exibição. 
Terá também um botão de voltar, a seta no canto superior esquerdo, para retornar a página principal. 

## Página principal

![image](https://user-images.githubusercontent.com/32063862/93277214-2ff69400-f798-11ea-8e70-4d493afac08a.png) ![image](https://user-images.githubusercontent.com/32063862/93277221-3553de80-f798-11ea-8e00-a06c31cd9d3d.png)

A tela dos favoritos o próprio nome já diz, nela conterá todos os cards dos profissionais selecionados na página principal, caso não tenha nenhuma essa página ficará em branco. Será possível também as desmarcar para removê-las dos favoritos. 
Como padrão, no appbar haverá uma seta para voltar a página principal. 




