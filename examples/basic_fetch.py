"""Minimal Scrapling example: fetch a page and extract data with CSS selectors.

Install: pip install "scrapling[fetchers]"
"""
from scrapling.fetchers import Fetcher

page = Fetcher.get("https://quotes.toscrape.com/")
quotes = page.css(".quote .text::text").getall()
print(quotes[:3])
