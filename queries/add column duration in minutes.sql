ALTER TABLE context_dataset_pro
ADD COLUMN duration_min NUMERIC;
UPDATE context_dataset_pro
SET duration_min = EXTRACT(epoch FROM duration) / 60;