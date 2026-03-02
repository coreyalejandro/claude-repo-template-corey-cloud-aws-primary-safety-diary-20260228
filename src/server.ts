import pino from 'pino';
import pinoHttp from 'pino-http';
import { createApp } from './app';

const log = pino({ level: process.env.LOG_LEVEL ?? 'info' });
const app = createApp();

app.use(
  pinoHttp({
    logger: log,
    customSuccessMessage: (req, res) => `${req.method} ${req.url} ${res.statusCode}`,
  }),
);

const port = Number(process.env.PORT ?? 3000);
app.listen(port, () => {
  log.info({ port }, 'server listening');
});
