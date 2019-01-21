# Dev docker for Chez Léo

This is the docker that I use to develop my own blog [«Chez Léo»](xiaojieli.com).

## Requirement

1. `docker`
2. `make`

## Configuration

1. Copy a new `.env` file from `.env.dist`:

  ```bash
  cp .env.dist .env
  ```

2. Change the value `APP_DIR` to the realy location of app folder

## Usage

1. `make build`: Builds containers.
2. `make up`: Starts containers.
3. `make down`: Stop containers.
4. `make dev`: Go into interact mode of dev cli.
5. `make restart`: Restarts containers.
6. `make again`: Go through all the steps from to `build` to `dev`.
