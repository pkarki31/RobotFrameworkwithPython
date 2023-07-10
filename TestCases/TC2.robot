*** Settings ***
Library   Browser

*** Test Cases ***
Example Test
    new browser    chromium
    new context    viewport={'width': 1920, 'height': 1080}
    New Page       https://playwright.dev