DEMO_DIR = vaccination_demographics_data

# More orderly; only the fields I need; over time
bloomberg/aggregate.csv: bloomberg/aggregate.py
	python3 bloomberg/aggregate.py > $@

bloomberg/%.json: bloomberg/%.html
	python3 bloomberg/parse.py $< > $@

$(DEMO_DIR)/2021-03-27.json:
	curl https://web.archive.org/web/20210328012733if_/https://covid.cdc.gov/covid-data-tracker/COVIDData/getAjaxData?id=vaccination_demographics_data -o $@

$(DEMO_DIR)/2021-02-09.json:
	curl https://web.archive.org/web/20210210054942if_/https://covid.cdc.gov/covid-data-tracker/COVIDData/getAjaxData?id=vaccination_demographics_data -o $@

kff_raw_data.csv: Makefile
	curl -o $@ 'https://www.kff.org/other/state-indicator/covid-19-vaccinations-by-race-ethnicity/?activeTab=graph&currentTimeframe=0&startTimeframe=3&selectedDistributions=race-categories-include-hispanic-individuals--white-percent-of-vaccinations--black-percent-of-vaccinations--hispanic-percent-of-vaccinations--asian-percent-of-vaccinations--american-indian-or-alaska-native-percent-of-vaccinations--native-hawaiian-or-other-pacific-islander-percent-of-vaccinations--other-percent-of-vaccinations--percent-of-vaccinations-with-known-race--percent-of-vaccinations-with-unknown-race--percent-of-vaccinations-with-known-ethnicity--percent-of-vaccinations-with-unknown-ethnicity&selectedRows=%7B%22states%22:%7B%22all%22:%7B%7D%7D%7D&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D'

