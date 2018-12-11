*** Settings ***
Library    Selenium2Library
Resource    source.robot

*** Test Case ***
Open
    OpenPantip
Tag
    ClickTag
Serach
    SearchComment
GetPost
    Select New Window
    In to Post