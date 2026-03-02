import { describe, expect, test } from 'vitest';
import { add } from '../src/index';

describe('add', () => {
  test('adds two numbers', () => {
    expect(add(2, 3)).toBe(5);
  });
});
