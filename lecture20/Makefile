all: derived_data/projection.csv

derived_data/character_powers_wide.csv: source_data/characters.csv preprocess.R
	Rscript preprocess.R

derived_data/projection.csv: project_tsne.R derived_data/character_powers_wide.csv
	Rscript project_tsne.R

.PHONY: clean
clean:
	rm -f derived_data/character_powers_wide.csv derived_data/projection.csv

.PHONY: shiny
shiny: derived_data/projection.csv
	Rscript shiny_power_grid.R