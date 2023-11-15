CREATE TABLE IF NOT EXISTS currencies
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    code      VARCHAR(3) NOT NULL UNIQUE,
    full_name VARCHAR(128),
    sign      VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS exchange_rates
(
    id                 INTEGER PRIMARY KEY AUTOINCREMENT,
    base_currency_id   INTEGER    NOT NULL,
    target_currency_id INTEGER    NOT NULL,
    rate               DECIMAL(6) NOT NULL,
    FOREIGN KEY (base_currency_id) REFERENCES currencies (id),
    FOREIGN KEY (target_currency_id) REFERENCES currencies (id),
    UNIQUE (base_currency_id, target_currency_id)
)
