# Planejamento de Implementação - Mercado Matonense

Este documento detalha as **Requisitos Funcionais (RF)** definidos em `requirements.md` com escopo de desenvolvimento, casos de uso, critérios de aceitação e estimativas de implementação. Ele servirá como guia para o time durante a construção do MVP e iterações subsequentes.

---

## RF001: Cadastro e Autenticação

**Descrição:** permitir que usuários se cadastrem e façam login no sistema com perfis distintos.

### Subtarefas
1. Modelar entidades `User` com campos: nome, e-mail, telefone, senha (hash).
2. Implementar endpoints de API: POST `/register`, POST `/login`, GET `/logout`.
3. Criar telas Flutter: formulário de cadastro, tela de login, roteamento condicional (autenticado/não).
4. Diferenciar perfis (consumidor, comerciante) durante cadastro.
5. Configurar armazenamento seguro de token (JWT) no app.

### Critérios de Aceitação
- Usuário consegue criar conta com e-mail único e senha forte.
- Formulários validam obrigatoriedade e formato de e-mail.
- Após login bem‑sucedido, app exibe tela de Home e mantém usuário logado entre sessões.
- Comerciante e consumidor recebem escopos diferentes (e.g., comerciantes veem painel de gestão).

### Dependências
- Banco de dados (PostgreSQL) com tabela `users`.
- Biblioteca de criptografia de senha (bcrypt).

### Estimativa: 3 sprints

---

## RF002: Gerenciamento de Produtos

**Descrição:** comércio pode cadastrar, editar e remover produtos.

### Subtarefas
1. Modelar entidade `Product` com: nome, descrição, preço, categoria, imagens, estoque.
2. Endpoints API: CRUD em `/products` (protegido para comerciantes).
3. Interfaces Flutter de listagem (painel do comerciante) e formulário de edição.
4. Upload de imagens (usar armazenamento cloud ou API multipart).
5. Validação de dados no frontend e backend.

### Critérios de Aceitação
- Comerciante visualiza lista de seus produtos.
- Formulário rejeita enviados incompletos e arquivos não permitidos.
- Edits refletem imediatamente na listagem de produtos.
- Exclusão remove de forma segura (soft delete).

### Dependências
- Autenticação (RF001).
- Serviço de armazenamento de mídia.

### Estimativa: 4 sprints

---

## RF003: Busca e Filtragem

**Descrição:** usuários podem localizar produtos/lojas por diversos critérios.

### Subtarefas
1. Implementar endpoint `/search` com parâmetros `q`, `category`, `minPrice`, `maxPrice`, `lat`, `lng`, `radius`.
2. Otimizar consultas (indices no banco) e considerar ElasticSearch ou PostgreSQL full-text.
3. Criar widget Flutter de busca global com campo e filtros expansíveis.
4. Implementar ordenações e paginação.
5. Mostrar resultados na Home e em tela dedicada.

### Critérios de Aceitação
- Busca retorna itens compatíveis com palavra-chave e filtros aplicados.
- Geolocalização usa API de mapas para cálculo de distância.
- Paginação evita sobrecarga de dados.

### Dependências
- Banco de dados configurado para índices.
- API de mapas para coordenadas.

### Estimativa: 3 sprints

---

## RF004: Carrinho e Checkout

**Descrição:** fluxo de compra desde seleção até pagamento.

### Subtarefas
1. Criar modelo `Cart` no app (local ou backend). 
2. Endpoints API para gerenciar carrinho/pedido: POST `/cart`, PUT `/cart`, POST `/checkout`.
3. Calcular frete usando serviço de geolocalização e endereço do usuário.
4. Integrar gateway de pagamento (PIX, cartão).
5. Tela Flutter de carrinho e formulário de checkout.
6. Notificações de status de pedido (email/push).

### Critérios de Aceitação
- Usuário adiciona/ remove itens e vê total atualizado.
- Frete calculado corretamente e exibido antes de pagar.
- Pagamento processado e pedido confirmado com mensagem e notificação.
- Comerciante recebe aviso de novo pedido.

### Dependências
- RF001 (autenticação).
- Integrações: gateway de pagamento, serviço de mapas.

### Estimativa: 5 sprints

---

## RF005: Anúncios e Promoções

**Descrição:** comerciantes criam anúncios que aparecem em destaque.

### Subtarefas
1. Modelar `Advertisement` com imagem, link, validade.
2. Endpoint `/ads` para CRUD, com limite por comerciante.
3. Cron job/backend logic para expirar anúncios antigos.
4. Flutter: carrossel na Home e painel de criação de anúncios.
5. Backend aplica limite de 3 anúncios/mês gratuitos.

### Critérios de Aceitação
- Anúncios aparecem na Home em ordem cronológica.
- Comerciante não consegue exceder limite mensal.
- Imagens redimensionadas e otimizadas.

### Dependências
- RF002 para uploads.

### Estimativa: 2 sprints

---

## RF006: Localização e Entrega

**Descrição:** mostrar localização de lojas e calcular rotas.

### Subtarefas
1. Integrar mapas (Google Maps/OSM) no app.
2. Adicionar campos de endereço às lojas.
3. Endpoint de geocodificação para obter lat/long.
4. Cálculo de rota/frete no backend ou via APIs de terceiros.
5. Tela de mapa com marcadores de lojas.

### Critérios de Aceitação
- Usuário vê mapa interativo com lojas próximas.
- Distância entre usuário e loja bem calculada.
- Opções de retirada ou entrega com estimativas.

### Dependências
- API de mapas e autorização de uso.

### Estimativa: 3 sprints

---

## RF007: Avaliações e Feedback

**Descrição:** consumidores avaliam produtos/lojas.

### Subtarefas
1. Modelos `Rating`, `Review` com ligação a pedido/usuário.
2. Endpoints para postar e listar avaliações.
3. Cálculo de média e exibição nos perfis.
4. Interface Flutter para escrever e ler comentários.
5. Moderação de conteúdo (admin).

### Critérios de Aceitação
- Avaliações aparecem somente após compra.
- Média é recalculada corretamente.
- Comentários com linguagem imprópria são denunciáveis.

### Dependências
- RF004 (ordens/pedidos).

### Estimativa: 2 sprints

---

## RF008: Expansão Regional

**Descrição:** suportar múltiplas cidades com configurações próprias.

### Subtarefas
1. Adicionar entidade `Region` ao backend com parâmetros (moeda, taxas).
2. Filtrar conteúdo por região no login/registro.
3. Painel admin para criar/editar regiões.
4. API pública para integração de outros sistemas regionais.
5. Documentar processo de onboard de nova cidade.

### Critérios de Aceitação
- Novo registro de região cria ambiente isolado de dados.
- Usuário só vê comércios e produtos da sua região.
- API permite consulta de regiões disponíveis.

### Dependências
- RF001 para distinguir região no usuário.

### Estimativa: 4 sprints

---

## RF009: Notificações

**Descrição:** sistema de notificações push e email.

### Subtarefas
1. Integrar serviço de push (Firebase Cloud Messaging).
2. Configurar envio de e-mails (SMTP, Mailgun).
3. Criar templates para diferentes eventos (pedido, promoção).
4. Gerenciar preferências de notificação no perfil do usuário.

### Critérios de Aceitação
- Usuário recebe notificação aprox. em tempo real.
- E-mails são enviados corretamente e não caem em SPAM.
- Configurações de opt-in/out funcionam.

### Dependências
- RF001 para identificar usuário.

### Estimativa: 3 sprints

---

Este planejamento pode ser revisado conforme prioridades de negócios e disponibilidade da equipe. Métodos ágeis como Scrum ou Kanban devem ser adotados para organizar as sprints com base nestas estimativas.
