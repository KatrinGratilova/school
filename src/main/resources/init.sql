CREATE TABLE homework
(
    id          smallserial PRIMARY KEY,
    name        varchar(30) NOT NULL,
    description text        NOT NULL
);

CREATE TABLE lesson
(
    id          smallserial PRIMARY KEY,
    name        varchar(30) NOT NULL,
    updated_at  timestamp   NOT NULL DEFAULT NOW(),
    homework_id smallint REFERENCES homework (id) ON DELETE CASCADE
);

CREATE TABLE schedule
(
    id         smallserial PRIMARY KEY,
    name       varchar(30) NOT NULL,
    updated_at timestamp   NOT NULL DEFAULT NOW()
);

CREATE TABLE lesson_in_schedule
(
    schedule_id smallint REFERENCES schedule (id) ON DELETE CASCADE,
    lesson_id   smallint REFERENCES lesson (id) ON DELETE CASCADE,
    PRIMARY KEY (schedule_id, lesson_id)
);