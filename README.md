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

### Passo 1: Clonar o Repositório

Clone o repositório para o seu computador local:

```bash
git clone https://github.com/sumioshi/forest_focus.git
```

### Passo 2: Instalar as Dependências do Flutter

Instale as dependências do projeto Flutter:

```bash
flutter pub get
```

### Passo 3: Instalar Dependências do Backend (Json Server)

O projeto usa o `json-server` para simular um backend. Para instalá-lo, siga estas etapas:

1. Se você não tem o `json-server` instalado globalmente, instale-o com o comando:

   ```bash
   npm install -g json-server
   ```

2. Caso você não tenha o **npm** instalado, você pode instalar o Node.js (que inclui o npm) a partir do [site oficial do Node.js](https://nodejs.org/).

3. Depois, no diretório do projeto, instale as dependências com o comando:

   ```bash
   npm install
   ```

### Passo 4: Iniciar o `json-server`

Para simular o backend, execute o seguinte comando para iniciar o servidor que irá monitorar o arquivo `db.json`:

```bash
json-server --watch db.json
```

Isso criará um backend simulado onde você pode armazenar e recuperar dados de sessões de foco e árvores.

### Passo 5: Executar o Aplicativo Flutter

Agora você está pronto para rodar o aplicativo Flutter. Execute o seguinte comando:

```bash
flutter run
```

### Passo 6: Acessar o Aplicativo

Após o aplicativo ser iniciado, ele será executado em um emulador ou dispositivo físico e você poderá ver a interface para gerenciar suas sessões de foco e visualizar a floresta.

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

---
