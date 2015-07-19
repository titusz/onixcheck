# -*- coding: utf-8 -*-
import logging


class OnixError(Exception):
    pass


class NullHandler(logging.Handler):
    """Not in python 2.6 so we use our own"""

    def emit(self, record):
        pass


def get_logger(logger_name='onixcheck', add_null_handler=True):
    logger = logging.getLogger(logger_name)
    if add_null_handler:
        logger.addHandler(NullHandler())
    return logger
