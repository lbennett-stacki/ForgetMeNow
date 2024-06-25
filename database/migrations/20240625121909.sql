-- Create "companies" table
CREATE TABLE `companies` (`id` uuid NOT NULL, `name` varchar NOT NULL, `email` varchar NOT NULL, `forgetfulness_score` int NOT NULL, PRIMARY KEY (`id`));
-- Create "complaints" table
CREATE TABLE `complaints` (`id` uuid NOT NULL, `user_id` uuid NOT NULL, `company_id` uuid NOT NULL, `erasure_request_id` uuid NOT NULL, `complaint_date` date NOT NULL, `status` varchar NOT NULL, PRIMARY KEY (`id`), CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`), CONSTRAINT `erasure_request_id` FOREIGN KEY (`erasure_request_id`) REFERENCES `erasure_requests` (`id`));
-- Create "email_addresses" table
CREATE TABLE `email_addresses` (`id` uuid NOT NULL, `user_id` uuid NOT NULL, `email_address` varchar NOT NULL, `is_primary` boolean NOT NULL, `is_verified` boolean NOT NULL, PRIMARY KEY (`id`), CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`));
-- Create "emails" table
CREATE TABLE `emails` (`id` uuid NOT NULL, `user_id` uuid NOT NULL, `company_id` uuid NULL, `from_address` varchar NOT NULL, `subject` varchar NOT NULL, `received_date` date NOT NULL, `erasure_request_date` date NOT NULL, `is_erasure_requested` boolean NOT NULL, PRIMARY KEY (`id`), CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`));
-- Create "erasure_requests" table
CREATE TABLE `erasure_requests` (`id` uuid NOT NULL, `email_id` uuid NOT NULL, `user_id` uuid NOT NULL, `company_id` uuid NOT NULL, `request_date` date NOT NULL, `response_received` boolean NOT NULL, `response_date` date NOT NULL, PRIMARY KEY (`id`), CONSTRAINT `email_id` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`), CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`), CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`));
-- Create "forwarding_inboxes" table
CREATE TABLE `forwarding_inboxes` (`id` uuid NOT NULL, `user_id` uuid NOT NULL, `custom_address` varchar NOT NULL, PRIMARY KEY (`id`), CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`));
-- Create "users" table
CREATE TABLE `users` (`id` uuid NOT NULL, `name` varchar NOT NULL, `auto_complain` boolean NOT NULL, PRIMARY KEY (`id`));
