# 00 — Start Here (Path-locked)

## Step 1 — Confirm you are in repo root

Command:

```bash
pwd
```

Expected output:

- The path ends with this repo folder name.

Common mistake:

- Running commands inside a subfolder.

Recovery:

- `cd <repo-root>` and retry.

## Step 2 — Run Doctor

Command:

```bash
./scripts/doctor.sh
```

Expected output:

- At least one ✅ for Node or Python.

Common mistake:

- File is not executable.

Recovery:

```bash
chmod +x ./scripts/*.sh
./scripts/doctor.sh
```

## Step 3 — Install Node deps (recommended)

Command:

```bash
npm install
```

Expected output:

- Packages installed successfully.

Common mistake:

- Old Node version.

Recovery:

- Upgrade Node, re-run `npm install`.

## Step 4 — Run Verify

Command:

```bash
./scripts/verify.sh
```

Expected output:

- "Verify complete."

Common mistake:

- Missing npm.

Recovery:

- Install Node/npm, rerun.
