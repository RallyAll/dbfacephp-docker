CREATE TABLE IF NOT EXISTS `dc_user` (
  userid        INTEGER PRIMARY KEY,
  creatorid     INTEGER DEFAULT 0,
  email         TEXT,
  name          TEXT UNIQUE,
  password      TEXT,
  permission    TINYINT DEFAULT 0,
  status        TINYINT DEFAULT 0,
  regip         TEXT,
  regdate       INTEGER,
  expiredate    INTEGER,
  plan          TEXT DEFAULT "level1"
);

CREATE TABLE IF NOT EXISTS dc_conn (
  connid     INTEGER PRIMARY KEY,
  creatorid  INTEGER,
  name       TEXT,
  hostname   TEXT,
  username   TEXT,
  password   TEXT,
  database   TEXT,
  dbdriver   TEXT,
  dbprefix   TEXT,
  pconnect   TINYINT default 0,
  char_set   TEXT,
  dbcollat   TEXT,
  swap_pre   TEXT,
  stricton   TEXT,
  port       TEXT,  
  createdate INTEGER
);

CREATE TABLE IF NOT EXISTS dc_category (
  categoryid INTEGER PRIMARY KEY,
  creatorid  INTEGER,
  name       TEXT,
  icon       TEXT,
  parentid   INTEGER
);

CREATE TABLE IF NOT EXISTS dc_app (
  appid           INTEGER PRIMARY KEY,
  connid          INTEGER,
  creatorid       INTEGER,
  type            TEXT,
  name            TEXT,
  title           TEXT,
  desc            TEXT,
  categoryid      INTEGER,
  form            TEXT,
  form_org        TEXT,
  script          TEXT,
  script_org      TEXT,
  scripttype      TEXT,
  confirm         TEXT,
  format          TEXT DEFAULT "tabular",
  options         TEXT,
  status          TEXT DEFAULT "draft",
  embedcode       TEXT,
  createdate      INTEGER
);

CREATE TABLE IF NOT EXISTS dc_app_permission (
  appid           INTEGER,
  userid          INTEGER
);

CREATE TABLE IF NOT EXISTS dc_uservisitlog (
  userid  INTEGER,
  type    TEXT,
  module  TEXT,
  action  TEXT,
  appid   INTEGER,
  message TEXT,
  url     TEXT,
  ip      TEXT,
  show    TINYINT,
  date    INTEGER
);

CREATE TABLE IF NOT EXISTS dc_customcss (
  creatorid   INTEGER,
  css         TEXT,
  date        INTEGER
);

CREATE TABLE IF NOT EXISTS dc_user_options (
  creatorid INTEGER,
  name      TEXT,
  type      TEXT,
  value     TEXT
);

CREATE TABLE IF NOT EXISTS dc_cache (
  creatorid   INTEGER,
  type        TEXT,
  datatype    TEXT default 'string',
  name        TEXT,
  value       TEXT,
  date        INTEGER
);

CREATE TABLE IF NOT EXISTS dc_user_dashboard (
  iddashboard TEXT NOT NULL,
  menu        TEXT default 'Dashboard',
  name        TEXT,
  layout      TEXT DEFAULT NULL,
  embedcode   TEXT
);

CREATE TABLE IF NOT EXISTS dc_tablelinks (
  connid INTEGER NOT NULL,
  srctable TEXT NOT NULL,
  srccolumn TEXT NOT NULL,
  dsttable TEXT NOT NULL,
  dstcolumn TEXT NOT NULL,
  creatorid INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS dc_code (
  creatorid INTEGER NOT NULL,
  connid INTEGER NOT NULL,
  api TEXT NOT NULL,
  public INTEGER DEFAULT 0,
  filename TEXT NOT NULL,
  content TEXT NOT NULL,
  date INTEGER NOT NULL
);
