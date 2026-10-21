-- Migration 001: Initial Schema for CryptoAlert
CREATE TABLE IF NOT EXISTS cryptoalert_entities (
    id VARCHAR(64) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(64) NOT NULL,
    status VARCHAR(32) NOT NULL DEFAULT 'AVAILABLE',
    metadata JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cryptoalert_leases (
    lease_id VARCHAR(64) PRIMARY KEY,
    entity_id VARCHAR(64) REFERENCES cryptoalert_entities(id),
    holder_id VARCHAR(128) NOT NULL,
    acquired_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    released BOOLEAN DEFAULT FALSE
);
