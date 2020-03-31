import pandas as pd                        
from pytrends.request import TrendReq
from keywords import KEYWORDS
csvfile='red_blue.csv'

def getstatas_csv():
	"""
	Query for Red and Blue, generates CSV file
	"""
	pytrend = TrendReq()
	#kw_list = ['red', 'blue'] # queries to searcg
	pytrend.build_payload(KEYWORDS)
	data = pytrend.interest_over_time()
	data.to_csv('red_blue.csv', encoding='utf_8_sig') # Dump trends to CSV file

def get_totalstats():
	"""
	Parse CSV file get total number of blue and red.
	"""
	getstatas_csv()
	df = pd.read_csv(csvfile)
	total_blue=df['blue'].sum()
	total_red=df['red'].sum()
	return (total_blue, total_red)
print("***************TRENDS FOR KEYWORDS *****************")
print("KEYWORDS", KEYWORDS )
print (get_totalstats())
