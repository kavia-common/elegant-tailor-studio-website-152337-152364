-- Seed data for Tailor Studio MySQL database
-- Assumes schema.sql has been run and the `myapp` database is selected.

USE `myapp`;

-- Seed contact submissions
INSERT INTO `contact_submissions` (`name`, `email`, `message`, `created_at`) VALUES
('Ava Thompson', 'ava.thompson@example.com', 'Hello! I would like to book a fitting appointment next week. Do you have availability on Thursday afternoon?', NOW() - INTERVAL 7 DAY),
('Noah Williams', 'noah.williams@example.com', 'I need alterations on a suit jacket. Could you provide an estimate and timeline?', NOW() - INTERVAL 3 DAY),
('Sophia Martinez', 'sophia.martinez@example.com', 'Do you offer bespoke wedding dresses? I''d love to discuss designs.', NOW() - INTERVAL 1 DAY);

-- Seed newsletter subscriptions
INSERT INTO `newsletter_subscriptions` (`email`, `subscribed_at`) VALUES
('newsletter.fan1@example.com', NOW() - INTERVAL 10 DAY),
('client.updates@example.com', NOW() - INTERVAL 5 DAY),
('elegant.tailor.subscriber@example.com', NOW() - INTERVAL 2 DAY)
ON DUPLICATE KEY UPDATE `subscribed_at` = VALUES(`subscribed_at`);
