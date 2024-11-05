# Forest Focus 🌳

## Sobre o Projeto

Forest Focus é um aplicativo de produtividade inspirado no Forest App, projetado para ajudar os usuários a manterem o foco e desenvolverem hábitos saudáveis de produtividade. O aplicativo utiliza uma abordagem gamificada onde cada sessão de foco bem-sucedida resulta em uma árvore plantada em sua floresta virtual.

### Principais Funcionalidades

- 🌱 Timer Pomodoro gamificado
- 🌲 Floresta virtual com árvores plantadas
- 📊 Dashboard de estatísticas
- 🏆 Sistema de conquistas
- 📱 Interface intuitiva e amigável

## Tecnologias Utilizadas

- Flutter 3.x
- Dart 3.x
- Provider (Gerenciamento de Estado)
- JSON Server (Backend Mock)
- Flutter Charts
- Shared Preferences
- HTTP Package

## Pré-requisitos

Antes de começar, você precisa ter instalado em sua máquina:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Node.js](https://nodejs.org/) (para o JSON Server)
- [Git](https://git-scm.com/)
- Um editor de código (recomendamos [VS Code](https://code.visualstudio.com/))

## Instalação e Execução

### 1. Clone o Repositório

```bash
git clone https://github.com/seu-usuario/forest_focus.git
cd forest_focus
```

### 2. Instale as Dependências do Flutter

```bash
flutter pub get
```

### 3. Configure o Backend Mock (JSON Server)

Instale o JSON Server globalmente:
```bash
npm install -g json-server
```

Inicie o servidor:
```bash
json-server --watch db.json --port 3000
```

### 4. Execute o Aplicativo

```bash
flutter run -d chrome
```

## Estrutura do Projeto

```
forest_focus/
├── lib/
│   ├── main.dart
│   └── src/
│       ├── models/           # Classes de domínio
│       ├── screens/          # Telas do aplicativo
│       ├── services/         # Serviços e APIs
│       ├── providers/        # Gerenciamento de estado
│       ├── utils/           # Utilitários e constantes
│       └── widgets/         # Widgets reutilizáveis
├── test/                    # Testes unitários e de widget
├── db.json                  # Banco de dados mock
└── pubspec.yaml            # Dependências do projeto
```

## API Endpoints (JSON Server)

O backend mock fornece os seguintes endpoints:

- `GET /users` - Lista de usuários
- `GET /sessions` - Sessões de foco
- `POST /sessions` - Criar nova sessão
- `GET /stats` - Estatísticas do usuário

## Testes

Para executar os testes unitários:

```bash
flutter test
```

## Funcionalidades Detalhadas

### Timer Pomodoro
- Sessões de foco configuráveis
- Contagem regressiva visual
- Notificações de início/fim
- Prevenção de interrupções

### Floresta Virtual
- Diferentes tipos de árvores
- Crescimento visual durante a sessão
- Histórico de árvores plantadas
- Estatísticas de crescimento

### Dashboard
- Tempo total focado
- Árvores plantadas
- Streaks de produtividade
- Gráficos de progresso

## Contribuição

1. Faça um Fork do projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Problemas Conhecidos

- O timer pode parar em segundo plano em alguns navegadores
- Algumas animações podem ser lentas em dispositivos mais antigos

## Próximos Passos

- [ ] Implementar autenticação de usuários
- [ ] Adicionar mais tipos de árvores
- [ ] Implementar sistema de achievements
- [ ] Adicionar suporte a múltiplos idiomas
- [ ] Melhorar as animações
- [ ] Adicionar sons ambientes

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Contato

Seu Nome - [@seutwitter](https://twitter.com/seutwitter)

Link do Projeto: [https://github.com/seu-usuario/forest_focus](https://github.com/seu-usuario/forest_focus)

## Agradecimentos

- [Flutter](https://flutter.dev)
- [JSON Server](https://github.com/typicode/json-server)
- [Forest App](https://www.forestapp.cc/) (Inspiração)