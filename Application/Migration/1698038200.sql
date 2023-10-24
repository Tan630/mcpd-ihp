ALTER TABLE play_results DROP COLUMN play_data;
ALTER TABLE play_results ADD COLUMN play_data TEXT NOT NULL;
