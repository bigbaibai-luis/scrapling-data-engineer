"""Stealth fetch that solves Cloudflare Turnstile.

Install: pip install "scrapling[fetchers]" && scrapling install
"""
from scrapling.fetchers import StealthyFetcher

StealthyFetcher.adaptive = True
page = StealthyFetcher.fetch(
    "https://nopecha.com/demo/cloudflare",
    headless=True,
    network_idle=True,
)
print(page.css("body").get()[:200])
