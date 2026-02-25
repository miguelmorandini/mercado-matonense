# User Stories e Tasks - Mercado Matonense

Este arquivo contém User Stories (US) numeradas sequencialmente, com tasks (T) debaixo de cada uma, reiniciando do 1 por história. Derivadas do planejamento em `planning.md`. Tarefas já concluídas estão marcadas com [x]. Inclui Cenários de Testes básicos como Critérios de Aceitação.

## RF001: Cadastro e Autenticação

**US001:** Como usuário novo, eu quero me cadastrar com e-mail e senha para acessar o marketplace.
- T1: [ ] Modelar entidade `User` com campos: nome, e-mail, telefone, senha (hash).
- T2: [ ] Implementar endpoints de API: POST `/register`, POST `/login`, GET `/logout`.
- T3: [ ] Criar telas Flutter: formulário de cadastro, tela de login, roteamento condicional (autenticado/não).
- T4: [ ] Diferenciar perfis (consumidor, comerciante) durante cadastro.
- T5: [ ] Configurar armazenamento seguro de token (JWT) no app.

**Critérios de Aceitação:**
- Cenário: Usuário preenche formulário com dados válidos e clica em cadastrar. Então, conta é criada e usuário é redirecionado para login.
- Cenário: Usuário tenta cadastrar com e-mail já existente. Então, erro "E-mail já cadastrado" é exibido.

**US002:** Como usuário registrado, eu quero fazer login seguro para acessar minhas funcionalidades.
- T1: [ ] Implementar endpoint POST `/login` com validação.
- T2: [ ] Criar tela de login no Flutter.
- T3: [ ] Armazenar token JWT no app.

**Critérios de Aceitação:**
- Cenário: Usuário insere credenciais corretas e faz login. Então, é redirecionado para Home e sessão é mantida.
- Cenário: Usuário insere senha incorreta. Então, erro "Credenciais inválidas" é exibido.

**US003:** Como usuário, eu quero logout para proteger minha conta.
- T1: [ ] Implementar endpoint GET `/logout`.
- T2: [ ] Adicionar botão de logout na UI.

**Critérios de Aceitação:**
- Cenário: Usuário logado clica em logout. Então, token é removido e usuário é redirecionado para login.

**US004:** Como app, eu quero telas de cadastro e login intuitivas para facilitar o acesso.
- T1: [ ] Criar formulários Flutter com validação.
- T2: [ ] Implementar roteamento condicional.

**Critérios de Aceitação:**
- Cenário: Usuário acessa app sem login. Então, é redirecionado para tela de login.
- Cenário: Formulário exibe erros para campos obrigatórios vazios.

**US005:** Como sistema, eu quero diferenciar perfis (consumidor/comerciante) para personalizar experiências.
- T1: [ ] Adicionar campo de perfil no cadastro.
- T2: [ ] Filtrar funcionalidades por perfil.

**Critérios de Aceitação:**
- Cenário: Usuário cadastra como comerciante. Então, vê painel de gestão após login.
- Cenário: Usuário cadastra como consumidor. Então, vê tela de compras.

**US006:** Como app, eu quero armazenar tokens JWT seguros para manter sessões.
- T1: [ ] Configurar armazenamento seguro (SharedPreferences ou similar).

**Critérios de Aceitação:**
- Cenário: Usuário faz login e fecha app. Então, ao reabrir, permanece logado.

## RF002: Gerenciamento de Produtos

**US007:** Como desenvolvedor, eu quero modelar a entidade Product para estruturar dados de produtos.
- T1: [x] Modelar entidade `Product` com: nome, descrição, preço, categoria, imagens, estoque.

**Critérios de Aceitação:**
- Cenário: Classe Product é definida com todos os campos obrigatórios.

**US008:** Como comerciante, eu quero endpoints CRUD para gerenciar meus produtos.
- T1: [ ] Implementar endpoints API: CRUD em `/products` (protegido para comerciantes).

**Critérios de Aceitação:**
- Cenário: Comerciante autenticado cria produto via POST. Então, produto é salvo no banco.
- Cenário: Comerciante edita produto via PUT. Então, mudanças são refletidas.

**US009:** Como comerciante, eu quero interfaces para listar e editar produtos no painel.
- T1: [ ] Interfaces Flutter de listagem (painel do comerciante) e formulário de edição.

**Critérios de Aceitação:**
- Cenário: Comerciante acessa painel. Então, vê lista de seus produtos.
- Cenário: Comerciante edita produto no formulário. Então, dados são atualizados.

**US010:** Como comerciante, eu quero upload de imagens para enriquecer descrições de produtos.
- T1: [ ] Upload de imagens (usar armazenamento cloud ou API multipart).

**Critérios de Aceitação:**
- Cenário: Comerciante seleciona imagem e salva. Então, imagem é armazenada e exibida.

**US011:** Como sistema, eu quero validação de dados para garantir integridade.
- T1: [ ] Validação de dados no frontend e backend.

**Critérios de Aceitação:**
- Cenário: Produto salvo com campo obrigatório vazio. Então, erro é exibido.

## RF003: Busca e Filtragem

**US012:** Como consumidor, eu quero buscar produtos por palavra-chave para encontrar o que preciso.
- T1: [ ] Implementar endpoint `/search` com parâmetro `q`.

**Critérios de Aceitação:**
- Cenário: Consumidor busca "maçã". Então, produtos com "maçã" no nome aparecem.

**US013:** Como consumidor, eu quero filtros por categoria, preço e localização para refinar resultados.
- T1: [ ] Adicionar parâmetros `category`, `minPrice`, `maxPrice`, `lat`, `lng`, `radius` ao `/search`.

**Critérios de Aceitação:**
- Cenário: Aplicar filtro de preço. Então, apenas produtos no range aparecem.

**US014:** Como sistema, eu quero otimizar consultas para respostas rápidas.
- T1: [ ] Otimizar consultas (indices no banco) e considerar ElasticSearch ou PostgreSQL full-text.

**Critérios de Aceitação:**
- Cenário: Busca retorna resultados em <2 segundos.

**US015:** Como app, eu quero widget de busca expansível para facilitar uso.
- T1: [ ] Criar widget Flutter de busca global com campo e filtros expansíveis.

**Critérios de Aceitação:**
- Cenário: Usuário clica em busca. Então, filtros se expandem.

**US016:** Como consumidor, eu quero resultados ordenados e paginados para navegar facilmente.
- T1: [ ] Implementar ordenações e paginação.
- T2: [ ] Mostrar resultados na Home e em tela dedicada.

**Critérios de Aceitação:**
- Cenário: Ordenar por preço. Então, produtos são listados do menor para maior.

## RF004: Carrinho e Checkout

**US017:** Como consumidor, eu quero adicionar produtos ao carrinho para preparar compras.
- T1: [ ] Criar modelo `Cart` no app (local ou backend).

**Critérios de Aceitação:**
- Cenário: Consumidor clica em "Adicionar ao carrinho". Então, produto é adicionado.

**US018:** Como consumidor, eu quero gerenciar carrinho (adicionar/remover) para ajustar pedidos.
- T1: [ ] Endpoints API para gerenciar carrinho/pedido: POST `/cart`, PUT `/cart`.

**Critérios de Aceitação:**
- Cenário: Remover item do carrinho. Então, total é recalculado.

**US019:** Como consumidor, eu quero calcular frete baseado na localização para ver custos totais.
- T1: [ ] Calcular frete usando serviço de geolocalização e endereço do usuário.

**Critérios de Aceitação:**
- Cenário: Inserir endereço. Então, frete é calculado e exibido.

**US020:** Como consumidor, eu quero opções de pagamento (PIX, cartão) para finalizar compras.
- T1: [ ] Integrar gateway de pagamento (PIX, cartão).

**Critérios de Aceitação:**
- Cenário: Selecionar PIX e confirmar. Então, pedido é processado.

**US021:** Como app, eu quero tela de checkout intuitiva para completar pedidos.
- T1: [ ] Tela Flutter de carrinho e formulário de checkout.

**Critérios de Aceitação:**
- Cenário: Carrinho com itens. Então, tela mostra resumo e botão de checkout.

**US022:** Como consumidor, eu quero notificações de status de pedido para acompanhar progresso.
- T1: [ ] Notificações de status de pedido (email/push).

**Critérios de Aceitação:**
- Cenário: Pedido confirmado. Então, notificação push é enviada.

## RF005: Anúncios e Promoções

**US023:** Como desenvolvedor, eu quero modelar Advertisement para estruturar anúncios.
- T1: [x] Modelar `Advertisement` com imagem, link, validade.

**Critérios de Aceitação:**
- Cenário: Classe Advertisement é definida com campos necessários.

**US024:** Como comerciante, eu quero criar anúncios com imagens para promover produtos.
- T1: [ ] Endpoint `/ads` para CRUD, com limite por comerciante.

**Critérios de Aceitação:**
- Cenário: Comerciante cria anúncio. Então, aparece na Home se dentro do limite.

**US025:** Como sistema, eu quero expirar anúncios automaticamente para manter relevância.
- T1: [ ] Cron job/backend logic para expirar anúncios antigos.

**Critérios de Aceitação:**
- Cenário: Anúncio expira. Então, não é mais exibido.

**US026:** Como consumidor, eu quero ver carrossel de anúncios na Home para descobrir promoções.
- T1: [x] Flutter: carrossel na Home e painel de criação de anúncios.

**Critérios de Aceitação:**
- Cenário: Acessar Home. Então, carrossel de anúncios é visível.

**US027:** Como sistema, eu quero limitar anúncios por comerciante para equilíbrio.
- T1: [ ] Backend aplica limite de 3 anúncios/mês gratuitos.

**Critérios de Aceitação:**
- Cenário: Comerciante tenta criar 4º anúncio. Então, erro é exibido.

## RF006: Localização e Entrega

**US028:** Como consumidor, eu quero ver mapas com lojas próximas para escolher locais.
- T1: [ ] Integrar mapas (Google Maps/OSM) no app.

**Critérios de Aceitação:**
- Cenário: Acessar mapa. Então, marcadores de lojas próximas aparecem.

**US029:** Como comerciante, eu quero adicionar endereços às lojas para localização.
- T1: [ ] Adicionar campos de endereço às lojas.

**Critérios de Aceitação:**
- Cenário: Comerciante edita loja. Então, endereço é salvo.

**US030:** Como sistema, eu quero geocodificação para calcular distâncias.
- T1: [ ] Endpoint de geocodificação para obter lat/long.

**Critérios de Aceitação:**
- Cenário: Endereço inserido. Então, coordenadas são calculadas.

**US031:** Como consumidor, eu quero cálculo de rotas e frete para estimar entregas.
- T1: [ ] Cálculo de rota/frete no backend ou via APIs de terceiros.

**Critérios de Aceitação:**
- Cenário: Selecionar entrega. Então, rota e frete são estimados.

**US032:** Como app, eu quero tela de mapa interativa para explorar.
- T1: [ ] Tela de mapa com marcadores de lojas.

**Critérios de Aceitação:**
- Cenário: Interagir com mapa. Então, detalhes da loja aparecem.

## RF007: Avaliações e Feedback

**US033:** Como consumidor, eu quero avaliar produtos após compra para compartilhar opinião.
- T1: [ ] Modelos `Rating`, `Review` com ligação a pedido/usuário.

**Critérios de Aceitação:**
- Cenário: Após compra, avaliar produto. Então, avaliação é salva.

**US034:** Como consumidor, eu quero ver médias de avaliações nos perfis para decidir compras.
- T1: [ ] Endpoints para postar e listar avaliações.
- T2: [ ] Cálculo de média e exibição nos perfis.

**Critérios de Aceitação:**
- Cenário: Ver produto. Então, média de estrelas é exibida.

**US035:** Como app, eu quero interfaces para escrever e ler comentários.
- T1: [ ] Interface Flutter para escrever e ler comentários.

**Critérios de Aceitação:**
- Cenário: Escrever comentário. Então, aparece na lista.

**US036:** Como admin, eu quero moderar conteúdo para manter qualidade.
- T1: [ ] Moderação de conteúdo (admin).

**Critérios de Aceitação:**
- Cenário: Admin marca comentário como inapropriado. Então, é ocultado.

## RF008: Expansão Regional

**US037:** Como admin, eu quero adicionar regiões com configurações próprias para expansão.
- T1: [ ] Adicionar entidade `Region` ao backend com parâmetros (moeda, taxas).

**Critérios de Aceitação:**
- Cenário: Admin cria região. Então, configurações são aplicadas.

**US038:** Como usuário, eu quero conteúdo filtrado por região para relevância local.
- T1: [ ] Filtrar conteúdo por região no login/registro.

**Critérios de Aceitação:**
- Cenário: Usuário de região X. Então, vê apenas produtos de X.

**US039:** Como admin, eu quero painel para gerenciar regiões.
- T1: [ ] Painel admin para criar/editar regiões.

**Critérios de Aceitação:**
- Cenário: Admin acessa painel. Então, pode editar regiões.

**US040:** Como sistema, eu quero API pública para integrações regionais.
- T1: [ ] API pública para integração de outros sistemas regionais.

**Critérios de Aceitação:**
- Cenário: Sistema externo chama API. Então, dados regionais são retornados.

**US041:** Como equipe, eu quero documentação de onboard para novas cidades.
- T1: [ ] Documentar processo de onboard de nova cidade.

**Critérios de Aceitação:**
- Cenário: Documento existe e descreve passos.

## RF009: Notificações

**US042:** Como consumidor, eu quero notificações push para status de pedidos.
- T1: [ ] Integrar serviço de push (Firebase Cloud Messaging).

**Critérios de Aceitação:**
- Cenário: Pedido atualizado. Então, push é recebido.

**US043:** Como usuário, eu quero e-mails para confirmações e promoções.
- T1: [ ] Configurar envio de e-mails (SMTP, Mailgun).

**Critérios de Aceitação:**
- Cenário: Cadastro. Então, e-mail de boas-vindas é enviado.

**US044:** Como sistema, eu quero templates de notificação para eventos.
- T1: [ ] Criar templates para diferentes eventos (pedido, promoção).

**Critérios de Aceitação:**
- Cenário: Evento ocorre. Então, template correto é usado.

**US045:** Como usuário, eu quero gerenciar preferências de notificação.
- T1: [ ] Gerenciar preferências de notificação no perfil do usuário.

**Critérios de Aceitação:**
- Cenário: Desabilitar e-mails. Então, não recebe mais.

## RNF: Atributos de Qualidade (Histórias Técnicas)

### RNF001: Performance
**US046:** Como sistema, eu quero cache local para reduzir tempos de resposta.
- T1: [ ] Implementar cache local (Hive ou similar) para reduzir tempo de resposta em buscas e carregamentos.

**Critérios de Aceitação:**
- Cenário: Dados em cache. Então, carregamento é mais rápido.

**US047:** Como backend, eu quero índices otimizados para consultas <2s.
- T1: [ ] Otimizar consultas de banco de dados com índices e paginação para tempo < 2 segundos.

**Critérios de Aceitação:**
- Cenário: Consulta executada. Então, tempo <2s.

**US048:** Como infraestrutura, eu quero auto-scaling para suportar 10k usuários.
- T1: [ ] Configurar auto-scaling na nuvem para suportar 10.000 usuários simultâneos.

**Critérios de Aceitação:**
- Cenário: 10k usuários. Então, sistema escala automaticamente.

### RNF002: Segurança
**US049:** Como sistema, eu quero criptografia de dados sensíveis para proteção.
- T1: [ ] Implementar criptografia de senhas e dados sensíveis (bcrypt, AES).

**Critérios de Aceitação:**
- Cenário: Dados salvos. Então, são criptografados.

**US050:** Como backend, eu quero validações contra ataques para segurança.
- T1: [ ] Adicionar validações contra SQL injection e XSS no backend e frontend.

**Critérios de Aceitação:**
- Cenário: Tentativa de ataque. Então, é bloqueada.

**US051:** Como sistema, eu quero conformidade LGPD para legalidade.
- T1: [ ] Garantir conformidade com LGPD (auditorias, consentimento de dados).

**Critérios de Aceitação:**
- Cenário: Auditoria. Então, conformidade é verificada.

### RNF003: Usabilidade
**US052:** Como app, eu quero interface responsiva para mobile/web.
- T1: [ ] Tornar interface responsiva para mobile e web usando widgets adaptativos do Flutter.

**Critérios de Aceitação:**
- Cenário: Redimensionar tela. Então, layout se adapta.

**US053:** Como app, eu quero acessibilidade para usuários com necessidades especiais.
- T1: [ ] Implementar suporte a acessibilidade (leitores de tela, alto contraste) com Semantics.

**Critérios de Aceitação:**
- Cenário: Usar leitor de tela. Então, conteúdo é lido.

**US054:** Como app, eu quero navegação intuitiva para melhor experiência.
- T1: [ ] Melhorar navegação intuitiva com bottom navigation e breadcrumbs.

**Critérios de Aceitação:**
- Cenário: Navegar. Então, caminho é claro.

### RNF004: Escalabilidade
**US055:** Como arquitetura, eu quero microsserviços para independência.
- T1: [ ] Refatorar arquitetura para microsserviços (separar API em serviços independentes).

**Critérios de Aceitação:**
- Cenário: Serviço isolado. Então, falha em um não afeta outros.

**US056:** Como infraestrutura, eu quero cloud com load balancing para crescimento.
- T1: [ ] Migrar para cloud (AWS/Google Cloud) com auto-scaling e load balancing.

**Critérios de Aceitação:**
- Cenário: Tráfego aumenta. Então, load é balanceado.

### RNF005: Disponibilidade
**US057:** Como sistema, eu quero backups automáticos para recuperação.
- T1: [ ] Configurar backup automático de dados no PostgreSQL/Redis.

**Critérios de Aceitação:**
- Cenário: Falha. Então, dados são restaurados de backup.

**US058:** Como infraestrutura, eu quero monitoramento para uptime 99.5%.
- T1: [ ] Implementar monitoramento e alertas para manter uptime de 99.5%.

**Critérios de Aceitação:**
- Cenário: Sistema roda. Então, uptime >99.5%.

### RNF006: Compatibilidade
**US059:** Como app, eu quero suporte a plataformas específicas para alcance.
- T1: [ ] Garantir suporte a Android 8+, iOS 12+ e web (Chrome, Firefox, Safari) via testes.

**Critérios de Aceitação:**
- Cenário: Executar em plataforma. Então, funciona sem erros.

**US060:** Como sistema, eu quero integração com mapas para localização.
- T1: [ ] Integrar APIs de mapas (Google Maps ou OSM) para localização.

**Critérios de Aceitação:**
- Cenário: Solicitar mapa. Então, dados são carregados.