-- Add column "average_response_time_minutes" to table: "companies"
ALTER TABLE `companies` ADD COLUMN `average_response_time_minutes` int NULL;
-- Add column "average_forget_time_minutes" to table: "companies"
ALTER TABLE `companies` ADD COLUMN `average_forget_time_minutes` int NULL;
