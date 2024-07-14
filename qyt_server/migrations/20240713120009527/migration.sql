BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "image" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category_question" (
    "id" bigserial PRIMARY KEY,
    "categoryId" bigint NOT NULL,
    "questionId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "category_questions_index_idx" ON "category_question" USING btree ("categoryId", "questionId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "questions" (
    "id" bigserial PRIMARY KEY,
    "content" text NOT NULL,
    "a" text NOT NULL,
    "b" text NOT NULL,
    "c" text NOT NULL,
    "d" text NOT NULL,
    "answer" text NOT NULL,
    "point" bigint NOT NULL,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz" (
    "id" bigserial PRIMARY KEY,
    "title" text,
    "description" text,
    "time" bigint,
    "createdAt" timestamp without time zone,
    "updatedAt" timestamp without time zone,
    "status" text,
    "type" text
);

-- Indexes
CREATE INDEX "quiz_status_idx" ON "quiz" USING btree ("status");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_question" (
    "id" bigserial PRIMARY KEY,
    "quizId" bigint NOT NULL,
    "questionId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "quiz_questions_index_idx" ON "quiz_question" USING btree ("quizId", "questionId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_result" (
    "id" bigserial PRIMARY KEY,
    "typeId" bigint NOT NULL,
    "userId" bigint,
    "type" text NOT NULL,
    "correctCount" bigint NOT NULL,
    "wrongCount" bigint NOT NULL,
    "passedCount" bigint NOT NULL,
    "point" bigint NOT NULL,
    "createdAt" timestamp without time zone,
    "startedAt" timestamp without time zone,
    "endAt" timestamp without time zone
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "category_question"
    ADD CONSTRAINT "category_question_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;
ALTER TABLE ONLY "category_question"
    ADD CONSTRAINT "category_question_fk_1"
    FOREIGN KEY("questionId")
    REFERENCES "questions"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "quiz_question"
    ADD CONSTRAINT "quiz_question_fk_0"
    FOREIGN KEY("quizId")
    REFERENCES "quiz"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;
ALTER TABLE ONLY "quiz_question"
    ADD CONSTRAINT "quiz_question_fk_1"
    FOREIGN KEY("questionId")
    REFERENCES "questions"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;


--
-- MIGRATION VERSION FOR qyt
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('qyt', '20240713120009527', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240713120009527', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
