import { describe, expect, test } from 'vitest';
import request from 'supertest';
import { createApp } from '../src/app';

describe('http service', () => {
  test('healthz returns ok', async () => {
    const app = createApp();
    const res = await request(app).get('/healthz');
    expect(res.status).toBe(200);
    expect(res.body).toEqual({ ok: true });
  });

  test('root returns service metadata', async () => {
    const app = createApp();
    const res = await request(app).get('/');
    expect(res.status).toBe(200);
    expect(res.body.service).toBe('claude-repo-template');
  });
});
