CREATE TABLE user
(
    user_id bigint,
    user_login VARCHAR(255),
    user_password CHAR(64),
    user_email VARCHAR(400),
    PRIMARY KEY (user_id)
);

CREATE TABLE message
(
    message_id bigint,
    message_datetime DATETIME,
    message_text TEXT,
    message_chat_id bigint,
    message_user_id bigint,
    PRIMARY KEY (message_id)
);

CREATE TABLE user_chat
(
    user_chat_chat_id bigint,
    user_chat_user_id bigint,
    PRIMARY KEY (user_chat_chat_id,user_chat_user_id)
);

CREATE TABLE chat
(
    chat_id bigint,
    chat_topic VARCHAR(32),
    chat_password CHAR(64),
    user_chat_user_id bigint,
    PRIMARY KEY (chat_id)
);

CREATE INDEX user_login_idx ON user (user_login);
ALTER TABLE message ADD FOREIGN KEY message_chat_id_idxfk (message_chat_id) REFERENCES chat (chat_id);

ALTER TABLE message ADD FOREIGN KEY message_user_id_idxfk (message_user_id) REFERENCES user (user_id);

ALTER TABLE user_chat ADD FOREIGN KEY user_chat_user_id_idxfk (user_chat_user_id) REFERENCES user (user_id);

ALTER TABLE chat ADD FOREIGN KEY chat_id_idxfk (chat_id,user_chat_user_id) REFERENCES user_chat (user_chat_chat_id,user_chat_user_id);