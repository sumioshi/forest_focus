# Forest Focus 🌳

Uma aplicação Flutter inspirada no Forest App para gestão de tempo e produtividade. Plante árvores virtuais enquanto mantém o foco nas suas tarefas!

## Funcionalidades 🌟

- **Sessões de Foco**: Configure sessões de tempo personalizadas (15-60 minutos)
- **Árvores Virtuais**: Diferentes tipos de árvores crescem enquanto você mantém o foco
- **Histórico**: Acompanhe todas as suas sessões completadas
- **Visualização**: Veja suas árvores crescendo em tempo real

## Tecnologias Utilizadas 🚀

- Flutter
- Provider para gerenciamento de estado
- Json Server para backend simulado
- Testes unitários

## Estrutura do Projeto 📁

```
lib/
├── src/
    ├── models/
    │   ├── focus_session.dart
    │   ├── tree.dart
    │   └── user.dart
    ├── providers/
    │   └── focus_provider.dart
    ├── screens/
    │   ├── focus_timer_screen.dart
    │   ├── forest_screen.dart
    │   ├── home_screen.dart
    │   ├── session_form_screen.dart
    │   ├── sessions_list_screen.dart
    │   └── stats_screen.dart
    ├── services/
    │   ├── focus_service.dart
    │   └── tree_service.dart
    ├── utils/
    │   └── theme_dark.dart
    └── widgets/
        ├── timer_widget.dart
        └── tree_widget.dart
```

## Como Executar 🔧

1. Clone o repositório
```bash
git clone https://seu-repositorio/forest_focus.git
```

2. Instale as dependências
```bash
flutter pub get
```

3. Inicie o json-server
```bash
json-server --watch db.json
```

4. Execute o aplicativo
```bash
flutter run
```

## Testes 🧪

Para executar os testes:
```bash
flutter test
```

## Requisitos Atendidos ✅

- [x] Duas classes de domínio com relacionamentos (User -> FocusSession, User -> Tree)
- [x] Tela de listagem (SessionsListScreen)
- [x] Tela de formulário (SessionFormScreen)
- [x] Tela de dashboard (HomeScreen)
- [x] Menu de navegação (BottomNavigationBar)
- [x] CRUD completo com backend (json-server)
- [x] Componentes reutilizáveis (TimerWidget, TreeWidget)
- [x] Testes unitários

## Contribuindo 🤝

Sinta-se à vontade para enviar pull requests ou reportar issues.

## Licença 📝

Este projeto está sob a licença MIT.