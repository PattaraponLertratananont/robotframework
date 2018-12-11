*** Settings ***
Library    Selenium2Library
*** Variable ***
${tag}    ฟุตบอล
${btn_tag}    xpath=//div[@class="header-outer"]/ul[@class="global-navigate"]/li/a[@href="/tags"]
${btn_sp}    xpath=//h1[text()="${tag}"]
                    
*** Keywords ***
Open Pantip
    Open Browser    https://www.pantip.com/    gc

Click Tag
    Click Element    ${btn_tag}
    Click Element    ${btn_sp}
    Select Window    locator=NEW
    Search Comment
    Select New Window
Search Comment
    ${round}    Get Element Count    xpath=//div[@id="show_topic_lists"]/div
    Log To Console    have comment : ${round}
    :FOR  ${index}  IN RANGE    0    ${round}
    \    ${count_comment}    Get Element Count   xpath=//div[@class[contains(.,'post-item')]][${index}]//div[@class="post-item-by"]/div[@class="post-item-status-i"]
    \    Run Keyword If    ${count_comment}>0    Run Keywords    Set Variable public    ${index}    AND    Exit For Loop
Set Variable Public
    [Arguments]    ${index}
    Set Global Variable    ${first_comment}    ${index}
Select New Window    
    Click Element    xpath=//div[@id="show_topic_lists"]/div[@class[contains(.,'post-item')]][${first_comment}]/div[@class="post-item-title"]/a
    ${window}    Get Text    xpath=//div[@id="show_topic_lists"]/div[@class[contains(.,'post-item')]][${first_comment}]/div[@class="post-item-title"]
    Select Window    ${window} - Pantip
Get Comment
    ${count}   Get Element Count    xpath=//div[@class[contains(.,'display-post-wrapper with-top-border section-comment')]]
    :FOR  ${index}  IN RANGE    1    ${count}+1
    \    ${print}    Get Text    xpath=//div[@class[contains(.,'display-post-wrapper with-top-border section-comment')]][${index}]//div[@class="display-post-status-leftside"]/div[@class="display-post-story-wrapper comment-wrapper"]/div[@class="display-post-story"]
    \    Log To Console    \n Comment : ${index} ${print}