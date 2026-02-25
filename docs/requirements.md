# Requisitos do Sistema - Mercado Matonense

## Visão Geral

O Mercado Matonense é um marketplace digital projetado para conectar comércios locais à população de uma cidade (inicialmente Matão, SP), permitindo que pequenos e médios empreendedores exponham seus produtos de forma acessível e eficiente. O sistema visa promover o comércio local, reduzir a dependência de grandes plataformas externas e fomentar a economia regional. Futuramente, o sistema poderá se expandir para outras cidades ou regiões próximas, criando uma rede de marketplaces locais interconectados.

## Objetivos

- **Promover o Comércio Local**: Facilitar a exposição de produtos de comércios locais para consumidores da região.
- **Facilitar Compras**: Oferecer uma experiência de compra simples, intuitiva e segura para usuários finais.
- **Escalabilidade**: Suportar expansão para múltiplas cidades/regiões sem grandes reestruturações.
- **Sustentabilidade**: Incentivar práticas econômicas locais, reduzindo emissões de carbono associadas a compras em grandes centros.
- **Inclusão Digital**: Tornar acessível para comércios de pequeno porte, com baixo custo de entrada.

## Usuários e Perfis

1. **Consumidor**: Usuário final que busca e compra produtos locais.
2. **Comerciante**: Proprietário de estabelecimento comercial que cadastra e gerencia produtos.
3. **Administrador**: Equipe responsável por gerenciar o sistema, moderar conteúdo e expandir para novas regiões.

## Funcionalidades Principais

### Para Consumidores
- **Navegação e Busca**: Explorar produtos por categoria, localização ou busca por palavra-chave.
- **Visualização de Produtos**: Detalhes completos (preço, descrição, imagens, localização do comércio).
- **Anúncios e Promoções**: Carrossel de anúncios promocionais de comércios.
- **Carrinho e Checkout**: Adicionar produtos ao carrinho, finalizar compra com opções de entrega/retirada.
- **Avaliações e Comentários**: Avaliar produtos e comércios após compras.
- **Perfil de Usuário**: Histórico de compras, favoritos e configurações pessoais.

### Para Comerciantes
- **Cadastro de Produtos**: Adicionar, editar e remover produtos com fotos, descrições e preços.
- **Gerenciamento de Loja**: Perfil da loja com localização, horário de funcionamento e contato.
- **Anúncios Promocionais**: Criar anúncios para destacar produtos ou ofertas.
- **Relatórios de Vendas**: Acompanhar vendas, pedidos e feedback de clientes.
- **Integração com Pagamentos**: Receber pagamentos via métodos locais (PIX, cartão, etc.).

### Para Administradores
- **Gerenciamento de Usuários**: Moderar cadastros, bloquear usuários maliciosos.
- **Expansão Regional**: Adicionar novas cidades/regiões com configurações específicas.
- **Análise de Dados**: Dashboards com métricas de uso, vendas e engajamento.
- **Suporte e Manutenção**: Ferramentas para resolver disputas e atualizar o sistema.

## Requisitos Funcionais

### RF001: Cadastro e Autenticação
- Usuários devem se cadastrar com e-mail, senha e dados básicos (nome, telefone).
- Autenticação via login/logout seguro.
- Diferenciação de perfis (consumidor, comerciante).

### RF002: Gerenciamento de Produtos
- Comerciantes podem cadastrar produtos com: nome, descrição, preço, categoria, imagens (até 5 por produto), quantidade em estoque.
- Validação de dados obrigatórios.
- Possibilidade de editar/excluir produtos.

### RF003: Busca e Filtragem
- Campo de busca global por nome de produto ou comércio.
- Filtros por categoria, preço, localização (raio de distância).
- Ordenação por relevância, preço ou proximidade.

### RF004: Carrinho e Checkout
- Adicionar/remover produtos do carrinho.
- Cálculo automático de frete baseado na localização.
- Opções de pagamento: PIX, cartão de crédito/débito, dinheiro na entrega.
- Confirmação de pedido com notificação para comerciante e consumidor.

### RF005: Anúncios e Promoções
- Comerciantes podem criar anúncios com imagens e links para produtos.
- Exibição em carrossel na página inicial.
- Limite de anúncios ativos por comerciante (ex.: 3 por mês gratuito).

### RF006: Localização e Entrega
- Integração com mapas para mostrar localização de comércios.
- Cálculo de rotas e estimativa de entrega.
- Opções: retirada no local ou entrega domiciliar.

### RF007: Avaliações e Feedback
- Consumidores podem avaliar produtos/comércios (1-5 estrelas) e deixar comentários.
- Média de avaliações visível nos perfis.

### RF008: Expansão Regional
- Suporte a múltiplas cidades/regiões com configurações independentes (moeda, taxas, etc.).
- API para integração com sistemas externos de cada região.

### RF009: Notificações
- Push notifications para status de pedidos, promoções e lembretes.
- E-mails para confirmações e relatórios.

## Requisitos Não Funcionais

### RNF001: Performance
- Tempo de resposta < 2 segundos para buscas e carregamento de páginas.
- Suporte a pelo menos 10.000 usuários simultâneos na fase inicial.

### RNF002: Segurança
- Criptografia de dados sensíveis (senhas, pagamentos).
- Conformidade com LGPD (Lei Geral de Proteção de Dados).
- Proteção contra ataques comuns (SQL injection, XSS).

### RNF003: Usabilidade
- Interface responsiva para mobile e web.
- Suporte a acessibilidade (leitores de tela, alto contraste).
- Navegação intuitiva, inspirada em apps como Mercado Livre ou iFood.

### RNF004: Escalabilidade
- Arquitetura baseada em microsserviços para facilitar expansão.
- Suporte a cloud (ex.: AWS, Google Cloud) para auto-scaling.

### RNF005: Disponibilidade
- Uptime de 99.5% (manutenção programada).
- Backup automático de dados.

### RNF006: Compatibilidade
- Suporte a Android (versão 8+), iOS (versão 12+) e Web (Chrome, Firefox, Safari).
- Integração com APIs de mapas (Google Maps ou OpenStreetMap).

## Requisitos Técnicos

### Backend
- Linguagem: Node.js ou Python (Django/Flask) para APIs RESTful.
- Banco de Dados: PostgreSQL para dados relacionais; Redis para cache.
- Autenticação: JWT ou OAuth 2.0.
- Pagamentos: Integração com gateways como Stripe, PagSeguro ou PIX.

### Frontend
- Framework: Flutter para mobile (Android/iOS) e web.
- Estado: Provider ou Riverpod para gerenciamento de estado.
- APIs: HTTP para comunicação com backend.

### Infraestrutura
- Hospedagem: Render, Heroku ou AWS para backend; Firebase para notificações.
- CI/CD: GitHub Actions para deploy automático.
- Monitoramento: Logs com ELK Stack ou similar.

## Casos de Uso

### UC001: Consumidor Compra Produto
1. Usuário busca produto.
2. Adiciona ao carrinho.
3. Finaliza compra com entrega/retirada.
4. Recebe confirmação e notificação.

### UC002: Comerciante Cadastra Produto
1. Comerciante faz login.
2. Acessa painel de produtos.
3. Preenche formulário e salva.
4. Produto aparece na busca.

### UC003: Administrador Adiciona Nova Cidade
1. Admin acessa painel de regiões.
2. Cadastra nova cidade com configurações.
3. Usuários da nova região podem se registrar.

## Riscos e Mitigações

- **Concorrência com Grandes Plataformas**: Focar em valor local (entrega rápida, suporte personalizado).
- **Adesão de Comerciantes**: Campanhas de marketing e taxas baixas iniciais.
- **Privacidade de Dados**: Auditorias regulares e compliance com leis locais.
- **Escalabilidade Técnica**: Planejar arquitetura desde o início para crescimento.

## Próximos Passos

1. Prototipagem da UI/UX.
2. Desenvolvimento do MVP (busca, produtos, checkout).
3. Testes beta com comércios locais de Matão.
4. Lançamento e monitoramento de métricas.
5. Expansão para cidades vizinhas.

Este documento será atualizado conforme o desenvolvimento avança. Para dúvidas ou sugestões, entre em contato com a equipe de desenvolvimento.

> **Planejamento:** As RFs descritas acima têm um desdobramento detalhado no arquivo [planning.md](docs/planning.md), que veta tarefas, critérios de aceitação e estimativas de sprints. Consulte-o para organizar sprints e distribuir trabalho.</content>
<parameter name="filePath">c:\dev\sps\mercado\mercado-matonense\requirements.md