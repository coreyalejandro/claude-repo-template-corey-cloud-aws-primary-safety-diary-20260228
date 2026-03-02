import express from 'express';

export function createApp() {
  const app = express();
  app.disable('x-powered-by');
  app.use(express.json({ limit: '1mb' }));

  app.get('/healthz', (_req, res) => res.status(200).json({ ok: true }));
  app.get('/readyz', (_req, res) => res.status(200).json({ ready: true }));
  app.get('/', (_req, res) =>
    res
      .status(200)
      .json({ service: 'claude-repo-template', version: process.env.APP_VERSION ?? '0.1.0' }),
  );

  return app;
}
