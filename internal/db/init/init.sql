-- CREATE USER test WITH PASSWORD 'test';

-- CREATE DATABASE test
--     OWNER = test
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'en_US.utf8'
--     LC_CTYPE = 'en_US.utf8';


-- GRANT ALL PRIVILEGES ON DATABASE test TO test;

CREATE TABLE IF NOT EXISTS public."Users" (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    login_id TEXT UNIQUE NOT NULL,
    login_password TEXT NOT NULL,
    created TIMESTAMPTZ NOT NULL,
    updated TIMESTAMPTZ NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Tokens" (
    user_id BIGINT PRIMARY KEY,
    token TEXT NOT NULL,
    issued TIMESTAMPTZ NOT NULL,
    CONSTRAINT fk_tokens_user FOREIGN KEY (user_id) REFERENCES public."Users" (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public."Project" (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    name TEXT NOT NULL,
    created TIMESTAMPTZ NOT NULL,
    CONSTRAINT fk_project_user FOREIGN KEY (user_id) REFERENCES public."Users" (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public."Blocks" (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    "order" BIGINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_blocks_project FOREIGN KEY (project_id) REFERENCES public."Project" (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public."Text" (
    id BIGSERIAL PRIMARY KEY,
    text TEXT NOT NULL,
    block_id BIGINT NOT NULL,
    CONSTRAINT fk_text_block FOREIGN KEY (block_id) REFERENCES public."Blocks" (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public."Atachments" (
    id BIGSERIAL PRIMARY KEY,
    block_id BIGINT NOT NULL,
    attachments TEXT[],
    CONSTRAINT fk_attachments_block FOREIGN KEY (block_id) REFERENCES public."Blocks" (id) ON DELETE CASCADE
);