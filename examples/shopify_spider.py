"""Pull an entire Shopify store catalog, one item per variant.

Install: pip install "scrapling[fetchers]"
Replace `target_website` with a real store domain.
"""
from scrapling.spiders import ShopifySpider


class MyStore(ShopifySpider):
    target_website = "example.com"  # TODO: replace with a real store


result = MyStore().start()
result.items.to_json("products.json")
print(f"Exported {len(result.items)} items to products.json")
