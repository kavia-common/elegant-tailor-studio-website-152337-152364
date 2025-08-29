-- Tailor Studio Database Schema for MySQL
-- Database: myapp (configured via environment)
-- This script creates the necessary tables for contact submissions and newsletter subscriptions.

-- Use the database (assumes it is created by startup.sh as 'myapp')
-- If running manually and database name differs, replace `myapp` accordingly.
USE `myapp`;

-- Create table: contact_submissions
-- Stores messages users submit via the contact form.
CREATE TABLE IF NOT EXISTS `contact_submissions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL COMMENT 'Name of the person submitting the contact form',
  `email` VARCHAR(255) NOT NULL COMMENT 'Email of the person submitting the contact form',
  `message` TEXT NOT NULL COMMENT 'Message content from the contact form',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When the submission was created',
  PRIMARY KEY (`id`),
  KEY `idx_contact_created_at` (`created_at`),
  KEY `idx_contact_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create table: newsletter_subscriptions
-- Stores newsletter subscriber emails and subscription timestamps.
CREATE TABLE IF NOT EXISTS `newsletter_subscriptions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL COMMENT 'Subscriber email address',
  `subscribed_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When the email was subscribed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_newsletter_email` (`email`),
  KEY `idx_newsletter_subscribed_at` (`subscribed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Optional: simple view to help visualize recent activity (used by db visualizer or debugging)
CREATE OR REPLACE VIEW `recent_activity` AS
SELECT 'contact' AS `type`, `id`, `email`, `created_at` AS `ts`
FROM `contact_submissions`
UNION ALL
SELECT 'newsletter' AS `type`, `id`, `email`, `subscribed_at` AS `ts`
FROM `newsletter_subscriptions`
ORDER BY `ts` DESC;
