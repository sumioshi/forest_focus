# Forest Focus 🌳

Uma aplicação Flutter inspirada no Forest App para gestão de tempo e produtividade. Plante árvores virtuais enquanto mantém o foco nas suas tarefas e veja sua floresta crescer com cada sessão completada!

## Funcionalidades 🌟

- **Sessões de Foco Personalizáveis**: Configure sessões de tempo (15-60 minutos) e acompanhe seu progresso em tempo real.
- **Árvores Virtuais e Realização Visual**: Cada sessão completada planta uma árvore específica na sua floresta virtual, representando seu esforço.
- **Visualização da Floresta**: Veja suas árvores crescendo em uma visualização em grade, simulando uma floresta com diferentes tipos de árvores.
- **Gamificação e Motivação**: Ao manter o foco, você “planta” árvores, criando um incentivo visual para manter-se produtivo.

## Tecnologias Utilizadas 🚀

- **Flutter**: Framework para desenvolvimento cross-platform.
- **Provider**: Gerenciamento de estado eficiente para sessões, timers e visualização de floresta.
- **Json Server**: Backend simulado para armazenamento e recuperação de dados.
- **Testes Unitários**: Garantia de qualidade e funcionalidade através de testes automatizados.

## Estrutura do Projeto 📁

O projeto é organizado para facilitar a manutenção e expansão, com pastas dedicadas a cada aspecto funcional:

```
lib/
├── src/
│   ├── models/                     # Definição das classes de dados
│   │   ├── focus_session.dart       # Representa cada sessão de foco
│   │   ├── tree.dart                # Representa tipos de árvores
│   │   └── user.dart                # Representa os usuários do app
│   ├── providers/                  # Gerenciamento de estado
│   │   └── focus_provider.dart      # Lida com sessões, timers e floresta
│   ├── screens/                    # Telas da interface de usuário
│   │   ├── focus_timer_screen.dart  # Tela principal do temporizador de foco
│   │   ├── forest_screen.dart       # Visualização da floresta
│   │   ├── home_screen.dart         # Tela de navegação principal
│   │   ├── session_form_screen.dart # Formulário para nova sessão
│   │   ├── sessions_list_screen.dart # Histórico de sessões
│   │   └── stats_screen.dart        # Tela de estatísticas
│   ├── services/                   # Serviços para manipulação de dados
│   │   ├── focus_service.dart       # Interage com backend para sessões
│   │   └── tree_service.dart        # Lida com tipos de árvores
│   ├── test/                       # Testes unitários
│   │   ├── models/                 # Testes relacionados aos modelos
│   │   ├── providers/              # Testes para os providers
│   │   │   └── focus_provider_test.dart # Testes para FocusProvider
│   │   ├── services/               # Testes para os serviços
│   │   │   └── tree_service_test.dart
│   │   └── widgets/                # Testes para widgets
│   ├── utils/                      # Utilitários e temas
│   │   ├── string_extensions.dart   # Extensões de string úteis
│   │   └── theme_dark.dart          # Tema escuro do app
│   └── widgets/                    # Componentes visuais reutilizáveis
│       ├── timer_widget.dart        # Widget do timer de sessão
│       └── tree_widget.dart         # Widget visual das árvores
└── main.dart                        # Ponto de entrada da aplicação
```

## Como Executar 🔧

1. Clone o repositório:
   ```bash
   git clone https://github.com/sumioshi/forest_focus.git
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Inicie o json-server para simular o backend:
   ```bash
   json-server --watch db.json
   ```

4. Execute o aplicativo:
   ```bash
   flutter run
   ```

## Testes 🧪

Para garantir a qualidade e verificar funcionalidades, execute os testes unitários:

```bash
flutter test
```

Os testes verificam o correto funcionamento do `FocusProvider`, adicionando e completando sessões, além de atualizar o status da árvore na floresta.

## Requisitos Atendidos ✅

- [x] **Modelos de Dados e Relacionamento**: Classes de domínio (User -> FocusSession, User -> Tree).
- [x] **Listagem de Sessões**: `SessionsListScreen` exibe sessões passadas.
- [x] **Formulário de Nova Sessão**: `SessionFormScreen` permite criar novas sessões.
- [x] **Dashboard e Navegação**: `HomeScreen` com navegação por `BottomNavigationBar`.
- [x] **CRUD Completo**: Operações completas de sessão com backend em `json-server`.
- [x] **Componentes Reutilizáveis**: Widgets `TimerWidget` e `TreeWidget` para visualização de sessões e árvores.
- [x] **Testes Unitários**: Garantia de funcionamento com cobertura de testes automatizados para `FocusProvider`.
