import json
import sys
import os

DIR = 'bloomberg'

print('date,state,race_known,ethnicity_known')

for fname in os.listdir(DIR):
    if '.json' not in fname:
        continue
    with open(DIR + '/' + fname) as f:
        data = json.load(f)['demographics'][3:]
    date = fname.split('.')[0]
    for state in data:
        print(date + ',' + ','.join(state[k] for k in ['name', 'demoRaceDataQuality', 'demoEthnicityDataQuality']))
