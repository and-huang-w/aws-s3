# Página Web Estática com S3

O objetivo desta atividade é explorar na prática os conceitos de armazenamento utilizando o serviço AWS Simple Storage Service (S3). 

O Amazon S3 pode ser utilizado para hospedar sites estáticos.

Hospedar um site estático no Amazon S3 proporciona um site altamente escalável e de alto desempenho por uma fração do custo de um servidor Web tradicional.

Para hospedar um site estático no Amazon S3, configure um bucket do Amazon S3 para hospedagem e faça upload do conteúdo do seu site.

> Referência: [https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/WebsiteHosting.html](https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/WebsiteHosting.html)

<br>

## Arquitetura alvo

![Notifier](images/target_architecture.png)

<br>

## Passo a passo

1. Faça login no AWS Console.

   > **DICA !!!** O procedimento abaixo está no idioma Português. Caso por padrão sua página web da AWS não esteja no mesmo idioma, basta alterar através do ícone de engrenagem ⚙️ no topo da página.

2. Na barra de pesquisa no topo da página, digite **S3** e depois selecione o serviço S3.

3. Selecione **Criar bucket**.

4. Na tela de criação de bucket preencha apenas os campos abaixo (mantenha os demais com os valores padrão).

   - **Região da AWS**: Leste dos EUA (Norte da Virgínia) us-east-1
      > **ATENÇÃO !!!** Caso a região esteja diferente, selecione a região correta na parte superior direita da página. 
   - **Nome do bucket**: `bucket-name`
      > **ATENÇÃO !!!** Substitua o texto **bucket-name** por um nome de Bucket qualquer. 
   - **ACLs habilitadas**: selecionado
   - **Bloquear todo o acesso público**: desabilitado
   - **Reconheço que as configurações atuais podem fazer com que este bucket e os objetos dentro dele se tornem públicos.**: selecionado
   - **Versionamento de bucket**: Ativar

5. No final da tela clique em  **Criar bucket**

6. Clique sobre o nome do bucket criado.

7. No menu **Permissões** navegue até **Lista de controle de acesso (ACL)** e clique em **Editar**.

8. Para o beneficiário **Todos (acesso público)**, selecione as opções **Listar** e **Leitura**.

9. Marque a opção **Compreendo os efeitos dessas alterações em meus objetos e buckets.** e clique em **Salvar alterações**. 

10. Faça download dos arquivos [index.html](https://github.com/kledsonhugo/aws-s3/blob/main/app/index.html) e [error.html](https://github.com/kledsonhugo/aws-s3/blob/main/app/error.html).
    > **DICA !!!** O ícone de download ⬇️ pode ser usado para fazer download do arquivo.
 
11. Selecione o menu **Objetos**.

    - Clique em **Carregar**
    - Selecione **Adicionar arquivos**
    - Busque pelos arquivos `index.html` e `error.html` baixados anteriormente e os selecione
    - Em **Permissões**, selecione **Conceder acesso público de leitura**
    - Marque a opção **Compreendo o risco de conceder acesso público de leitura aos objetos especificados**
    - Clique em **Carregar**
    - Clique em **Fechar**

12. Selecione o menu **Propriedades**.

    - Navegue até **Hospedagem de Site estático**
    - Clique em **Editar**
    - Hospedagem de site estático: `Ativar`
    - Documento de índice: `index.html`
    - Documento de erro - opcional: `error.html`
    - Clique em **Salvar alterações**<br><br>

14. No menu **Propriedades** navegue até **Hospedagem de Site estático** e clique na url **Endpoint de site de bucket**.

<br>

**SUCESSO !!!** O sucesso dessa atividade será a abertura de uma página web pública na Internet mostrando o conteúdo do arquivo `index.html` hospedado no serviço AWS S3. Parabéns !!!
