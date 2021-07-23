:loop
curl httpbin.org/image/png > nul
curl -k https://httpbin.org/get > nul
curl whitehouse.gov > nul
curl amazon.com > nul
timeout 3
goto :loop
