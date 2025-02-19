@echo off
echo Setting up Crawl4AI environment...

REM Create and activate virtual environment
python -m venv venv
call venv\Scripts\activate

REM Install requirements
pip install -r requirements.txt
pip install fake-useragent
pip install playwright
playwright install

REM Create test file if it doesn't exist
echo from crawl4ai import AsyncWebCrawler > test_crawl.py
echo from crawl4ai.async_configs import BrowserConfig, CrawlerRunConfig >> test_crawl.py
echo. >> test_crawl.py
echo async def main(): >> test_crawl.py
echo     browser_config = BrowserConfig( >> test_crawl.py
echo         browser_type="chromium", >> test_crawl.py
echo         headless=True, >> test_crawl.py
echo         viewport_width=1920, >> test_crawl.py
echo         viewport_height=1080 >> test_crawl.py
echo     ) >> test_crawl.py
echo. >> test_crawl.py
echo     crawler_config = CrawlerRunConfig( >> test_crawl.py
echo         wait_until="networkidle", >> test_crawl.py
echo         page_timeout=30000 >> test_crawl.py
echo     ) >> test_crawl.py
echo. >> test_crawl.py
echo     crawler = AsyncWebCrawler(browser_config=browser_config) >> test_crawl.py
echo. >> test_crawl.py
echo     try: >> test_crawl.py
echo         await crawler.start() >> test_crawl.py
echo         result = await crawler.arun("https://example.com", config=crawler_config) >> test_crawl.py
echo         print(result.markdown) >> test_crawl.py
echo     finally: >> test_crawl.py
echo         await crawler.close() >> test_crawl.py
echo. >> test_crawl.py
echo if __name__ == "__main__": >> test_crawl.py
echo     import asyncio >> test_crawl.py
echo     asyncio.run(main()) >> test_crawl.py

echo Setup complete! You can now run: python test_crawl.py