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
