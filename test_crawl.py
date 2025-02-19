from crawl4ai import AsyncWebCrawler
from crawl4ai.async_configs import BrowserConfig, CrawlerRunConfig

async def main():
    # Create browser configuration
    browser_config = BrowserConfig(
        browser_type="chromium",
        headless=True,
        viewport_width=1920,
        viewport_height=1080
    )
    
    # Create crawler run configuration
    crawler_config = CrawlerRunConfig(
        wait_until="networkidle",
        page_timeout=30000
    )
    
    # Initialize crawler with browser config
    crawler = AsyncWebCrawler(browser_config=browser_config)
    
    try:
        # Start the crawler
        await crawler.start()
        # Run the crawl with specific configuration
        result = await crawler.arun("https://example.com", config=crawler_config)
        print(result.markdown)
    finally:
        # Make sure to close the crawler
        await crawler.close()

if __name__ == "__main__":
    import asyncio
    asyncio.run(main())