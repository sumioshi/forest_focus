const jsonServer = require('json-server');
const cors = require('cors');
const server = jsonServer.create();
const router = jsonServer.router('db.json');
const middlewares = jsonServer.defaults();

// Configuração CORS
server.use(cors({
  origin: true,
  credentials: true,
  preflightContinue: false,
  methods: 'GET,HEAD,PUT,PATCH,POST,DELETE'
}));
server.options('*', cors());

server.use(middlewares);
server.use(router);

server.listen(3000, () => {
  console.log('JSON Server is running on http://localhost:3000');
});