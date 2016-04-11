# -*- coding: utf-8 -*-
from os.path import abspath, dirname, join

ROOT = abspath(dirname(__file__))

VALID_ONIX2_REF = join(ROOT, 'valid_onix2_ref.xml')

VALID_ONIX3_REF = join(ROOT, 'valid_onix3_ref.xml')
VALID_ONIX3_SHORT = join(ROOT, 'valid_onix3_short.xml')

VALID_ONIX3_REF_NS = join(ROOT, 'valid_onix3_ref_ns.xml')

INVALID_ONIX3_REF = join(ROOT, 'invalid_onix3_ref.xml')
INVALID_ONIX_ROOT = join(ROOT, 'invalid_onix_root.xml')

VALID_GOOGLE_SAMPLE = join(ROOT, 'Google Sample ONIX 2.1.xml')

VALID_GOOGLE_ONIX_30_SAMPLE = join(ROOT, 'valid_google_onix_3.xml')
INVALID_GOOGLE_ONIX_30_SAMPLE = join(ROOT, 'invalid_google_onix_3.xml')
