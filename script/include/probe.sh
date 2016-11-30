#!/usr/bin/env bash
#
# Functions for probing capabilities.

has () {
  which $1 >/dev/null 2>&1
}
