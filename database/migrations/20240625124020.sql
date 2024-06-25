-- atlas:txtar

-- checks.sql --
SELECT NOT EXISTS (SELECT * FROM emails);
SELECT NOT EXISTS (SELECT * FROM erasure_requests);

-- migration.sql --
-- Disable the enforcement of foreign-keys constraints
PRAGMA foreign_keys = off;
-- Create "new_emails" table
CREATE TABLE `new_emails` (`id` uuid NOT NULL, `user_id` uuid NOT NULL, `company_id` uuid NULL, `from_address` varchar NOT NULL, `subject` varchar NOT NULL, `received_date` date NOT NULL, PRIMARY KEY (`id`), CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`));
-- Copy rows from old table "emails" to new temporary table "new_emails"
INSERT INTO `new_emails` (`id`, `user_id`, `company_id`, `from_address`, `subject`, `received_date`) SELECT `id`, `user_id`, `company_id`, `from_address`, `subject`, `received_date` FROM `emails`;
-- Drop "emails" table after copying rows
DROP TABLE `emails`;
-- Rename temporary table "new_emails" to "emails"
ALTER TABLE `new_emails` RENAME TO `emails`;
-- Create "new_erasure_requests" table
CREATE TABLE `new_erasure_requests` (`id` uuid NOT NULL, `email_id` uuid NOT NULL, `user_id` uuid NOT NULL, `company_id` uuid NOT NULL, `request_date` date NOT NULL, `response_date` date NULL, PRIMARY KEY (`id`), CONSTRAINT `email_id` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`), CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`));
-- Copy rows from old table "erasure_requests" to new temporary table "new_erasure_requests"
INSERT INTO `new_erasure_requests` (`id`, `email_id`, `user_id`, `company_id`, `request_date`, `response_date`) SELECT `id`, `email_id`, `user_id`, `company_id`, `request_date`, `response_date` FROM `erasure_requests`;
-- Drop "erasure_requests" table after copying rows
DROP TABLE `erasure_requests`;
-- Rename temporary table "new_erasure_requests" to "erasure_requests"
ALTER TABLE `new_erasure_requests` RENAME TO `erasure_requests`;
-- Rename a column from "custom_address" to "address"
-- atlas:nolint BC102
ALTER TABLE `forwarding_inboxes` RENAME COLUMN `custom_address` TO `address`;
-- Rename a column from "auto_complain" to "should_auto_complain"
-- atlas:nolint BC102
ALTER TABLE `users` RENAME COLUMN `auto_complain` TO `should_auto_complain`;
-- Enable back the enforcement of foreign-keys constraints
PRAGMA foreign_keys = on;
