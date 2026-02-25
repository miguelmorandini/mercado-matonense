# Mercado Matonense

Uma aplicação Flutter para o Mercado Matonense, um marketplace que permite aos usuários navegar por produtos, visualizar anúncios e realizar compras.

## Requisitos do Sistema

Para uma visão completa dos requisitos funcionais, não funcionais e técnicos do projeto, consulte o documento [requirements.md](requirements.md). Ele detalha a arquitetura, funcionalidades e planos de expansão para múltiplas cidades/regiões.

## Design e Arquitetura

Para entender a arquitetura atual ("as is") da aplicação, incluindo pontos fortes, fracos e sugestões de melhoria, consulte o documento [design.md](design.md). Ele analisa o código fonte e propõe evoluções.

## Funcionalidades

- **Página Inicial**: Exibe anúncios em carrossel e uma grade de produtos.
- **Produtos**: Listagem de produtos com cards interativos.
- **Anúncios**: Carrossel de anúncios promocionais.
- **Checkout**: Funcionalidade de finalização de compra (em desenvolvimento).
- **Busca**: Campo de busca na barra superior para encontrar produtos.

## Como Executar

### Pré-requisitos

- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado e configurado.
- Um emulador Android/iOS ou dispositivo conectado, ou navegador para execução web.

### Passos para Executar

1. **Clone o repositório** (se aplicável) e navegue até a pasta do projeto:
   ```
   cd c:\dev\sps\mercado\mercado-matonense
   ```

2. **Instale as dependências**:
   ```
   flutter pub get
   ```

3. **Execute a aplicação**:
   - Para Android/iOS:
     ```
     flutter run
     ```
   - Para Web:
     ```
     flutter run -d web-server --web-port 8080
     ```
     Em seguida, abra o navegador em `http://localhost:8080`.

4. **Build para produção**:
   - Para Web:
     ```
     flutter build web
     ```
     Os arquivos serão gerados em `build/web/`.

## Estrutura do Projeto

- `lib/`: Código fonte da aplicação.
  - `features/`: Funcionalidades principais (home, product, anuncio, checkout).
  - `config/`: Configurações da API.
- `android/`, `ios/`, `web/`: Configurações específicas da plataforma.
- `assets/`: Imagens e recursos estáticos.

## Recursos Adicionais

- [Documentação do Flutter](https://flutter.dev/docs)
- [Lab: Escreva seu primeiro app Flutter](https://docs.flutter.dev/get-started/codelab)
