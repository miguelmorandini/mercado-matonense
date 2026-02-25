# Design e Arquitetura - Mercado Matonense (Estado Atual - "As Is")

## Visão Geral

Este documento descreve a arquitetura atual da aplicação Mercado Matonense, um marketplace Flutter para comércios locais. O foco é analisar o design existente, seus pontos fortes e fracos, com base no código fonte disponível. A arquitetura segue princípios de desenvolvimento mobile com Flutter, priorizando simplicidade e funcionalidade básica para um MVP (Minimum Viable Product).

## Arquitetura Geral

A aplicação é construída com **Flutter**, um framework Dart para desenvolvimento cross-platform (Android, iOS e Web). A arquitetura é baseada em uma estrutura de pastas organizada por recursos (features), com separação de responsabilidades entre UI, lógica de negócio e acesso a dados.

### Padrões Utilizados
- **MVVM-like**: Widgets (View) interagem com serviços (Model/ViewModel) para dados.
- **Provider Pattern**: Embora não explicitamente usado no código atual, a estrutura permite integração futura com gerenciadores de estado como Provider ou Riverpod.
- **RESTful API**: Comunicação com backend via HTTP GET, sem autenticação ou cache local.
- **Modelo de Dados**: Classes Dart para representar entidades (Produto, Anuncio), com parsing JSON.

### Estrutura de Pastas
```
lib/
├── app.dart                 # Widget raiz da aplicação
├── main.dart                # Ponto de entrada
├── config/
│   └── api_config.dart      # Configuração da URL da API
└── features/
    ├── home/
    │   └── home_page.dart   # Página inicial com anúncios e produtos
    ├── product/
    │   ├── product_model.dart    # Modelo de dados para Produto
    │   ├── product_service.dart  # Serviço para buscar produtos
    │   └── product_card.dart     # Widget para exibir produto
    ├── anuncio/
    │   ├── anuncio_model.dart    # Modelo de dados para Anuncio
    │   ├── anuncio_service.dart  # Serviço para buscar anúncios
    │   └── anuncio_carousel.dart # Widget para carrossel de anúncios
    └── checkout/
        └── (em desenvolvimento)   # Funcionalidades de checkout
```

## Componentes Principais

### 1. **Configuração (config/)**
   - **ApiConfig**: Classe estática que define a URL base da API (`https://mercado-matonense-api.onrender.com`). Permite fácil troca entre ambientes (ex.: localhost para produção).

### 2. **Modelos de Dados (features/*/model.dart)**
   - **Produto**: Representa um produto com campos como `id`, `title`, `price`, `image`. Método `fromJson()` para conversão de JSON da API.
   - **Anuncio**: Similar ao Produto, para anúncios promocionais.
   - **Pontos**: Simples e extensível; mapeia campos da API (ex.: 'nome' → 'title').

### 3. **Serviços (features/*/service.dart)**
   - **ProdutoService**: Classe estática com método `getProdutos()` que faz GET para `/api/produtos` e retorna lista de Produto.
   - **AnuncioService**: Instância com método `buscarAnunciosHome()` para GET em `/api/anuncios/home`.
   - **Pontos**: Usa `http` package; tratamento básico de erros (lança Exception se status != 200).

### 4. **UI e Widgets (features/*/page.dart, card.dart, etc.)**
   - **HomePage**: StatefulWidget que combina anúncios (AnuncioCarousel) e produtos (SliverGrid com ProductCard). Usa FutureBuilder para carregamento assíncrono.
   - **AnuncioCarousel**: Carrossel horizontal de anúncios usando ListView.
   - **ProductCard**: Card simples com imagem, título e preço.
   - **App**: MaterialApp raiz com tema básico.

### 5. **Ponto de Entrada (main.dart)**
   - Inicializa o app com `runApp(MyApp())`, que usa HomePage como tela inicial.

## Fluxo de Dados

1. **Inicialização**: No `initState()` da HomePage, chama `ProdutoService.getProdutos()` e `AnuncioService.buscarAnunciosHome()`.
2. **Requisição API**: HTTP GET para endpoints da API; resposta JSON é decodificada.
3. **Parsing**: `fromJson()` converte JSON em objetos Dart (Produto/Anuncio).
4. **Renderização**: FutureBuilder atualiza UI com dados ou erros.
5. **Interação**: Usuário interage com cards (ex.: toque para detalhes, ainda não implementado).

Não há persistência local; dados são sempre buscados da API.

## Pontos Fortes

### 1. **Simplicidade e Rapidez de Desenvolvimento**
   - Estrutura clara e modular facilita manutenção e adição de features.
   - Flutter permite deploy rápido para múltiplas plataformas sem reescrita de código.
   - Uso de FutureBuilder para assincronia é idiomático e eficiente para casos simples.

### 2. **Separação de Responsabilidades**
   - Services isolam lógica de API, facilitando testes unitários e mudanças no backend.
   - Modelos padronizam dados, evitando inconsistências.

### 3. **Escalabilidade Inicial**
   - Estrutura por features permite expansão (ex.: adicionar "user" ou "order").
   - Configuração centralizada da API facilita deploy em diferentes ambientes.

### 4. **Cross-Platform**
   - Flutter garante consistência visual e performance em Android, iOS e Web.
   - Suporte nativo a widgets responsivos (ex.: GridView adaptável).

### 5. **Integração com API Externa**
   - Uso de `http` é padrão e confiável; fácil integração com Render (hospedagem atual).

## Pontos Fracos

### 1. **Falta de Gerenciamento de Estado**
   - Sem Provider, Bloc ou similar; estado é gerenciado localmente em widgets, dificultando compartilhamento (ex.: carrinho global).
   - Recarregamentos desnecessários ao navegar entre telas.

### 2. **Ausência de Cache e Persistência Local**
   - Toda busca é via API; sem offline ou cache, impacta performance e UX em conexões ruins.
   - Não armazena dados locais (ex.: SQLite ou Hive), perdendo estado ao fechar app.

### 3. **Tratamento de Erros Básico**
   - Apenas lança Exception genérica; sem retry, loading states avançados ou feedback detalhado.
   - UI mostra mensagens simples, mas não lida com cenários como timeout ou 404 específicos.

### 4. **Segurança e Autenticação**
   - Nenhuma autenticação (JWT, OAuth); API pública, vulnerável a abusos.
   - Dados sensíveis (ex.: preços) não criptografados; sem validação de entrada.

### 5. **Funcionalidades Incompletas**
   - Checkout em desenvolvimento; sem carrinho persistente, pagamentos ou notificações.
   - Busca limitada (apenas campo de texto, sem filtros avançados).
   - Sem testes automatizados (unitários ou de widget).

### 6. **Performance e Escalabilidade**
   - Sem paginação ou lazy loading; carrega tudo de uma vez, ineficiente para muitos produtos.
   - Imagens não otimizadas (sem cache ou compressão); pode causar lentidão.
   - Sem monitoramento (logs, analytics), dificultando debug em produção.

### 7. **Dependências e Manutenibilidade**
   - Poucas dependências (apenas `http`), bom para simplicidade, mas falta ferramentas como Dio (para interceptores) ou CachedNetworkImage.
   - Código em português (comentários), pode dificultar colaboração internacional.

## Melhorias Sugeridas

### Curto Prazo (Próximas Iterações)
- Adicionar gerenciamento de estado (ex.: Provider) para carrinho e navegação.
- Implementar cache local com `shared_preferences` ou `hive`.
- Melhorar tratamento de erros com retry e estados de loading mais ricos.
- Adicionar paginação e busca avançada.

### Médio Prazo
- Integrar autenticação e autorização.
- Adicionar testes (unitários com Mockito, widgets com Flutter Test).
- Otimizar imagens e performance (ex.: com `cached_network_image`).
- Implementar notificações push (Firebase).

### Longo Prazo
- Migrar para arquitetura mais robusta (ex.: Clean Architecture ou BLoC).
- Adicionar backend próprio se necessário, com microsserviços.
- Expandir para múltiplas regiões, com configurações dinâmicas.

Esta análise é baseada no código atual; conforme o desenvolvimento avança, o design evoluirá. Para discussões ou implementações, consulte o [requirements.md](requirements.md).

> **Relacionamento com o planejamento:** o documento [planning.md](docs/planning.md) deriva diretamente dos requisitos funcionais descritos aqui. Ele detalha como cada RF será abordado em sprints, tornando a transição de análise para execução mais transparente.</content>
<parameter name="filePath">c:\dev\sps\mercado\mercado-matonense\design.md