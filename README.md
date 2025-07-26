# Crypto Alerter

This application allows users to create cryptocurrency price alerts and receive notifications through various channels when the price of a specified cryptocurrency crosses a certain threshold.

## Features

*   Create, read, update, and delete price alerts for various cryptocurrencies (BTCUSDT, ETHUSDT, BNBUSDT).
*   Set alerts for when the price goes above or below a certain value.
*   Configure multiple notification channels.
*   Currently supported channels:
    *   Email
    *   Telegram
*   Background job processing using Sidekiq for sending notifications.

## System Dependencies

*   Ruby
*   PostgreSQL
*   Redis

## Getting Started

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/alex-tomilov/3Commas_crypto_alerter.git
    cd crypto_alerter
    ```

2.  **Install dependencies:**

    ```bash
    bundle install
    ```

3.  **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

4.  **Configure environment variables:**

    Create a `.env` file and add the following variables. You can use `.env.example` as a template.

    ```
    CRYPTO_ALERTER_DATABASE_USER=<your_database_user>
    CRYPTO_ALERTER_DATABASE_PASSWORD=<your_database_password>
    TELEGRAM_BOT_TOKEN=<your_telegram_bot_token>
    ```

5.  **Run the application:**

    ```bash
    ./bin/dev
    ```

    This will start the Rails server, and the Sidekiq process for background jobs.

## Services

*   **Sidekiq:** Used for background job processing. You can monitor Sidekiq's dashboard at `/sidekiq`.
*   **Redis:** Used by Sidekiq for storing jobs.

## Deployment

This application can be deployed using [Kamal](https://kamal-deploy.org/). The configuration can be found in `config/deploy.yml`.
