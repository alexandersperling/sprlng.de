#!/bin/sh

htmlhint ./**/*.html
csslint ./**/*.css --ignore=ids,bulletproof-font-face,box-model,compatible-vendor-prefixes,regex-selectors,unqualified-attributes,qualified-headings,universal-selector
