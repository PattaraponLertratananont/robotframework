*** Settings ***
Library    Selenium2Library
Resource    source.robot

*** Test Case ***
Search And Print First Post Have Comment
    [Documentation]    ค้นหากระทู้ล่าสุดที่มีคอมเมนต์
    Given Open Pantip
    When Click Tag
    Then Get Comment