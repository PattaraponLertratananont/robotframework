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
    SelectWindowwwwww
    In to Post