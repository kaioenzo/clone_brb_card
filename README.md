# BRB Card Clone

Aplicativo flutter de um clone do aplicativo BRB Card. Utilizando o padrão de arquitetura MVVM.

## Features

- Carrossel de contas com detalhes do cartão
- Histórico de transações com agrupamento por data
- Acesso rápido a serviços favoritos
- Navegação inferior personalizada
- UI responsiva com fundos degradê
- Implementação de arquitetura MVVM
- Injeção de dependência
- View models testados unitariamente
- Internacionalização

## Dependências

- **Flutter 3.x**
- Dart 2.17
- Provider (State Management)
- Intl (Date Formatting)
- Mockito (Testing)
- flutter_test

## Architecture Overview
📁 lib/
├── 📁 data/ # Camada de dados
│ └── 📁 services/ # Comunicação com API 
│
├── 📁 domain/ # Camada de lógica de negócio
│ ├── 📁 models/ # Entidades
│
├── 📁 ui/
│ ├── 📁 home/ # Feature
│ │ ├── 📁 view_models/ # ViewModels
│ │ └── 📁 widgets/ # Componentes de UI 
│ │
│ └── 📁 main/ # App scaffolding
│
└── 📁 widgets/ # Componentes reutilizados

### Arquitetura MVVM 

### Visão Geral
1. **Modelos**: Classes Dart puras representando entidades de negócio
2. **Serviços**: Camada de acesso a dados (clientes de API)
3. **ViewModels**: Controladores de lógica de negócio com gerenciamento de estado
4. **Widgets**: Componentes da camada de apresentação
5. **Injeção de Dependência**: Implementação com o pacote Provider

## Detalhes Chave da Implementação

### Gerenciamento de Estado
- **ChangeNotifier** para mudanças de estado no ViewModel
- **MultiProvider** para injeção de dependência
- **Consumer** widgets para reconstruções otimizadas


### Estratégia de Testes
- Testes unitários para ViewModels
- Mock de dependências da camada de serviço
- Verificação de mudanças de estado
- Testes de cenários de erro

## Primeiros Passos

### Requisitos
- Flutter SDK 3.0+
- Dart 2.17+
- Android Studio/VSCode

### Installation
```bash
git clone https://github.com/kaioenzo/clone_brb_card
cd brb-card-app
flutter pub get
flutter run
```