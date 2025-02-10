CREATE TABLE public.messages (
    id uuid PRIMARY KEY,
    "receiverID" INTEGER NOT NULL,
    "senderID" INTEGER NOT NULL,
    "time" TIMESTAMP NOT NULL,
    "date" DATE NOT NULL,
    "carID" uuid,
    "motorbikeID" uuid,
    "categoryID" integer,
    CONSTRAINT fk_receiver FOREIGN KEY ("receiverID") REFERENCES public.users(id),
    CONSTRAINT fk_sender FOREIGN KEY ("senderID") REFERENCES public.users(id),
    CONSTRAINT fk_car FOREIGN KEY ("carID") REFERENCES public.cars(id),
    CONSTRAINT fk_motorbike FOREIGN KEY ("motorbikeID") REFERENCES public.motorbikes(id),
    CONSTRAINT fk_category FOREIGN KEY ("categoryID") REFERENCES public.category(id),
    CONSTRAINT check_one_reference CHECK (
        ("carID" IS NOT NULL)::int +
        ("motorbikeID" IS NOT NULL)::int +
        ("categoryID" IS NOT NULL)::int = 1
    )
);
ALTER TABLE messages ADD "messageContent" VARCHAR(255);

INSERT INTO messages (
    id,
    "receiverID",
    "senderID",
    time,
    date,
    "carID",
    "motorbikeID",
    "categoryID"
  )
VALUES (
    '89209508-aaf7-4bb4-bfff-f30c291d2b37',
    1,
    2,
    '2025-02-03 00:00:00',
    '03.02.2025',
    NULL,
    NULL,
    1
  );