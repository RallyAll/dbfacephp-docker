CREATE TABLE IF NOT EXISTS `dc_user` (
  `userid`        int unsigned NOT NULL AUTO_INCREMENT,
  `creatorid`     int unsigned default NULL,
  `email`         varchar(255) default NULL,
  `name`          varchar(64) NOT NULL,
  `password`      varchar(32) default NULL,
  `permission`    tinyint default 0,
  `status`        tinyint default 0,
  `regip`         varchar(15) default NULL,
  `regdate`       int unsigned NOT NULL,
  `expiredate`    int unsigned NOT NULL,
  `plan`          varchar(16) NOT NULL DEFAULT "level1",
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_conn` (
  `connid`     int unsigned NOT NULL AUTO_INCREMENT,
  `creatorid`  int unsigned NOT NULL,
  `name`       varchar(255) NOT NULL,
  `hostname`   varchar(255) NOT NULL,
  `username`   varchar(32) default NULL,
  `password`   varchar(128) NOT NULL,
  `database`   varchar(128) NOT NULL,
  `dbdriver`   varchar(32) default NULL,
  `dbprefix`   varchar(16) default NULL,
  `pconnect`   tinyint default 0,
  `char_set`   varchar(32) default NULL,
  `dbcollat`   varchar(32) default NULL,
  `swap_pre`   varchar(32) default NULL,
  `stricton`   varchar(32) default NULL,
  `port`       varchar(32) default NULL,  
  `createdate` int unsigned NOT NULL,
  PRIMARY KEY  (`connid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_category` (
  `categoryid` int unsigned NOT NULL AUTO_INCREMENT,
  `creatorid`  int unsigned NOT NULL,
  `name`       varchar(255) NOT NULL,
  `icon`       varchar(255) DEFAULT NULL,
  `parentid`   int unsigned,
  PRIMARY KEY  (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_app` (
  `appid`           int unsigned NOT NULL AUTO_INCREMENT,
  `connid`          int unsigned NOT NULL,
  `creatorid`       int unsigned NOT NULL,
  `type`            varchar(32) NOT NULL,
  `name`            varchar(64) default NULL,
  `title`           varchar(64) default NULL,
  `desc`            varchar(255) default NULL,
  `categoryid`      int unsigned default NULL,
  `form`            text default NULL,
  `form_org`        text default NULL,
  `script`          text default NULL,
  `script_org`      text default NULL,
  `scripttype`      varchar(32) default NULL,
  `confirm`         text default NULL,
  `format`          varchar(32) default "tabular",
  `options`         text default NULL,
  `status`          varchar(16) default "draft",
  `embedcode`       varchar(64) default NULL,
  `createdate`      int unsigned NOT NULL,
  PRIMARY KEY  (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_app_permission` (
  `appid`           int unsigned NOT NULL,
  `userid`          int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_uservisitlog` (
  `userid`  int unsigned NOT NULL,
  `type`    varchar(32) NOT NULL,
  `module`  varchar(32) default NULL,
  `action`  varchar(32) default NULL,
  `appid`   int unsigned DEFAULT NULL,
  `message` text default NULL,
  `url`     varchar(255) default NULL,
  `ip`      varchar(15) default NULL,
  `show`    tinyint default 0,
  `date`    int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_customcss` (
  `creatorid`   int unsigned NOT NULL,
  `css`         text default NULL,
  `date`        int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_user_options` (
  `creatorid` int unsigned NOT NULL,
  `name`   varchar(64) NOT NULL,
  `type`  varchar(16) default NULL,
  `value` varchar(64) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_cache` (
  `creatorid`   int unsigned NOT NULL,
  `type`        varchar(32) NOT NULL,
  `name`        varchar(255) default NULL,
  `datatype`    varchar(32) default 'string',
  `value`       text default NULL,
  `date`        int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_user_dashboard` (
  `iddashboard` varchar(16) NOT NULL,
  `menu` varchar(64) default "Dashboard",
  `name` varchar(100) DEFAULT NULL,
  `layout` text DEFAULT NULL,
  `embedcode`       varchar(64) default NULL,
  PRIMARY KEY (`iddashboard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_tablelinks` (
  `connid` int unsigned NOT NULL,
  `srctable` varchar(128) NOT NULL,
  `srccolumn` varchar(128) NOT NULL,
  `dsttable` varchar(128) NOT NULL,
  `dstcolumn` varchar(128) NOT NULL,
  `creatorid` int unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dc_code` (
  `creatorid` int unsigned NOT NULL,
  `connid` int unsigned NOT NULL,
  `api` varchar(128) NOT NULL,
  `public` tinyint(1) DEFAULT 0,
  `filename` varchar(128) NOT NULL,
  `content` TEXT NOT NULL,
  `date` int unsigned NOT NULL,
  PRIMARY KEY (`creatorid`, `api`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
