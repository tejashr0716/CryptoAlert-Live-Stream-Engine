-- Migration 002: B-Tree and GiST Indexes for Sub-Millisecond Scans
CREATE INDEX IF NOT EXISTS idx_cryptoalert_status ON cryptoalert_entities (status);
CREATE INDEX IF NOT EXISTS idx_cryptoalert_cat_status ON cryptoalert_entities (category, status);
CREATE INDEX IF NOT EXISTS idx_cryptoalert_lease_expires ON cryptoalert_leases (entity_id, expires_at) WHERE released = FALSE;
