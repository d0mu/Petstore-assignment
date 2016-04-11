from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver import Remote
import logging
import datetime


def get_today_date():
    now = datetime.datetime.now()
    return now.strftime('%d-%m-%Y')
