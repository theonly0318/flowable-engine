
UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.1.5 (192.168.1.5)', LOCKGRANTED = TIMESTAMP('2019-03-13 21:58:20.332') WHERE ID = 1 AND LOCKED = 0;

ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_ID_ VARCHAR(255);

ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_TYPE_ VARCHAR(255);

CALL SYSPROC.ADMIN_CMD ('REORG TABLE ACT_CO_CONTENT_ITEM');

CREATE INDEX idx_contitem_scope ON ACT_CO_CONTENT_ITEM(SCOPE_ID_, SCOPE_TYPE_);

INSERT INTO ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', CURRENT TIMESTAMP, 2, '7:5aa445d140a638ee432a00c23134dd98', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.5.3', '2510700489');

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

