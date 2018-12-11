*** Settings ***
Library    Selenium2Library
*** Variable ***
${tag}    หุ้น
${btn_tag}    xpath=//div[@class="header-outer"]/ul[@class="global-navigate"]/li/a[@href="/tags"]
${btn_sp}    xpath=//h1[text()="${tag}"]
${first_comment}
                    
*** Keywords ***
OpenPantip
    Open Browser    https://www.pantip.com/    gc

ClickTag
    Click Element    ${btn_tag}
    Click Element    ${btn_sp}
    Select Window    locator=NEW
SearchComment
    ${round}    Get Element Count    xpath=//div[@id="show_topic_lists"]/div
    Log To Console    have comment : ${round}
    :FOR  ${index}  IN RANGE    0    ${round}
    \    ${count_comment}    Get Element Count   xpath=//div[@class[contains(.,'post-item')]][${index}]//div[@class="post-item-by"]/div[@class="post-item-status-i"]
    \    Run Keyword If    ${count_comment}>0    Run Keywords    Set Variable public    ${index}    AND    Exit For Loop
    Log To Console    post_comment : ${index}
Set Variable public
    [Arguments]    ${index}
    Set Global Variable    ${first_comment}    ${index}
Select New Window    
    Click Element    xpath=//div[@id="show_topic_lists"]/div[@class[contains(.,'post-item')]][${first_comment}]/div[@class="post-item-title"]/a
    ${window}    Get Text    xpath=//div[@id="show_topic_lists"]/div[@class[contains(.,'post-item')]][${first_comment}]/div[@class="post-item-title"]
    Select Window    ${window} - Pantip
In to Post
    ${count}   Get Element Count    xpath=//div[@class[contains(.,'display-post-wrapper with-top-border section-comment')]]
    :FOR  ${gone}  IN RANGE    1    ${count}+1
    \    ${print}    Get Text    xpath=//div[@class[contains(.,'display-post-wrapper with-top-border section-comment')]][${gone}]//div[@class="display-post-status-leftside"]/div[@class="display-post-story-wrapper comment-wrapper"]/div[@class="display-post-story"]
    \    Log To Console    ${print}